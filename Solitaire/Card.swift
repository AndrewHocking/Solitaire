//
//  Card.swift
//  Solitaire
//
//  Created by Andrew Hocking on 2020-04-24.
//  Copyright © 2020 Andrew Hocking. All rights reserved.
//

import SwiftUI

struct Card: Equatable {
    var value: Int
    var suit: Suit
    
    init (value: Int, suit: Suit) {
        self.value = value
        self.suit = suit
    }
    static let example = Card(value: 10, suit: .heart)
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.value == rhs.value && lhs.suit == rhs.suit
    }
    
    func findTableauIndex(tableau: Tableau) -> (column: Int, row: Int)? {
        for i in 0..<tableau.cards.count {
            for j in 0..<tableau.cards[i].count {
                if tableau.cards[i][j] == self {
                    return (i, j)
                }
            }
        }
        return nil
    }
}

enum Suit: String {
    case club
    case heart
    case spade
    case diamond
    
    func color() -> Color {
        switch self {
        case .heart:
            return .red
        case .diamond:
            return .red
        case .spade:
            return .primary
        case .club:
            return .primary
        }
    }
}

enum CardState {
    case deck
    case stockPile
    case foundation
    case tableau
}

enum FlipState {
    case faceDown, faceUp
}

enum DragState {
    case good, bad, unknown
}

struct CardView: View, Identifiable {
    var card: Card
    var id = UUID()
    @State var flipState: FlipState? = FlipState.faceDown
    @State var dragAmount = CGSize.zero
    @State var dragState = DragState.unknown
    @State var cardState: CardState
    var onChanged: ((CGPoint, Card) -> DragState)?
    var onEnded: ((CGPoint, Card) -> Void)?
    
    @EnvironmentObject var deck: Deck
    @EnvironmentObject var stockPile: StockPile
    @EnvironmentObject var foundation: Foundation
    @EnvironmentObject var tableau: Tableau
    
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack {
            CardBack()
                .rotation3DEffect(.degrees(flipState == .faceDown ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                .opacity(flipState == .faceDown ? 100 : 0)
            CardFront(value: self.card.value, suit: self.card.suit)
                .rotation3DEffect(.degrees(flipState != .faceDown ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                .opacity(flipState != .faceDown ? 100 : -100)
        }
            .frame(width: 142, height: 200)
            .shadow(color: Color.clear, radius: 0)
            .shadow(color: Color.blue, radius: 0)
            .overlay(dragColor)
            .zIndex(dragAmount == .zero ? 0 : 10000)
            .offset(dragAmount)
            .opacity(self.opacity)
            .simultaneousGesture (
                DragGesture()
                    .onChanged {
                        if self.flipState == .faceUp && (self.cardState == .tableau || self.cardState == .stockPile) {
                            self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                            self.dragState = self.onChanged?($0.location, self.card) ?? .unknown
                        }
                    }
                    .onEnded { _ in
                        if self.dragState == .good {
                            
                        }
                        self.dragAmount = .zero
                    }
            )
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            switch self.cardState {
                            case .tableau:
                                withAnimation {
                                    print("Tableau")
                                    if self.flipState == .faceDown {
                                        self.flip()
                                    } else if let index = self.card.findTableauIndex(tableau: self.tableau) {
                                        if index.row == self.tableau.cards[index.column].count - 1 && (self.foundation.topCard(suit: self.card.suit) ?? Card(value: 0, suit: self.card.suit)).value == self.card.value - 1 {
                                            self.cardState = .foundation
                                            self.foundation.addToPile(card: self.tableau.cards[index.column].popLast()!)
                                            self.tableau.printCards()
                                            self.tableau.cards = self.tableau.cards
                                            self.tableau.objectWillChange.send()
                                            self.opacity = 0
                                        }
                                    }
                                }
                                return
                            case .deck:
                                withAnimation {
                                    print("Deck")
                                    if self.flipState == .faceDown && self.deck.cards.last == self.card {
                                        print("Top")
                                        self.stockPile.cards.append(self.deck.cards.popLast()!)
                                    }
                                }
                                return
                            case .stockPile:
                                withAnimation {
                                    switch self.card.suit {
                                    case .club:
                                        if (self.foundation.clubs.last ?? Card(value: 0, suit: .club)).value == self.card.value - 1 {
                                            self.foundation.clubs.append(self.stockPile.cards.popLast()!)
                                        }
                                        return
                                    case .heart:
                                        if (self.foundation.hearts.last ?? Card(value: 0, suit: .heart)).value == self.card.value - 1 {
                                            self.foundation.hearts.append(self.stockPile.cards.popLast()!)
                                        }
                                        return
                                    case .spade:
                                        if (self.foundation.spades.last ?? Card(value: 0, suit: .spade)).value == self.card.value - 1 {
                                            self.foundation.spades.append(self.stockPile.cards.popLast()!)
                                        }
                                        return
                                    case .diamond:
                                        if (self.foundation.diamonds.last ?? Card(value: 0, suit: .diamond)).value == self.card.value - 1 {
                                            self.foundation.diamonds.append(self.stockPile.cards.popLast()!)
                                        }
                                        return
                                    }
                                }
                            case .foundation:
                                withAnimation {
                                    return
                                }
                            }
                        }
                    }
            )
            .scaleEffect(CGFloat(SceneDelegate.cardSize))
    }
    
    func flip() {
        self.flipState = self.flipState == .faceUp ? .faceDown : .faceUp
    }
    
    var dragColor: Color {
        if self.dragState == .unknown || self.dragAmount == .zero {
            return Color.clear//blue.opacity(0.5)
        } else if self.dragState == .good {
            return Color.green.opacity(0.5)
        } else if self.dragState == .bad {
            return Color.red.opacity(0.5)
        } else {
            return Color.clear
        }
    }
}

private struct CardFront: View {
    var value: Int
    var suit: Suit
    var valueString: String {
        if (value == 1) {
            return "A"
        } else if (value == 11) {
            return "J"
        } else if (value == 12) {
            return "Q"
        } else if (value == 13) {
            return "K"
        } else if (value == 14) {
            return ""
        } else {
            return "\(value)"
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.defaultColor)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.defaultColor, lineWidth: 10))
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(self.suit.color(), lineWidth: 4))
            ZStack {
                HStack {
                    VStack (spacing: 2){
                        Text(valueString)
                            .bold()
                            .foregroundColor(self.suit.color())
                            .font(.system(.title, design: .serif))
                        if (self.value < 14) {
                            Image(systemName: "suit.\(self.suit.rawValue).fill")
                                .foregroundColor(self.suit.color())
                                .font(.system(.body, design: .serif))
                        }
                        Spacer()
                    }
                        .scaleEffect(0.9)
                        .padding(.leading, 7)
                        .padding(.top, -7)
                    Spacer()
                    VStack (spacing: 2){
                        Text(valueString)
                            .bold()
                            .foregroundColor(self.suit.color())
                            .font(.system(.title, design: .serif))
                            if (self.value < 14) {
                                Image(systemName: "suit.\(self.suit.rawValue).fill")
                                    .foregroundColor(self.suit.color())
                                    .font(.system(.body, design: .serif))
                            }
                        Spacer()
                    }
                        .scaleEffect(0.9)
                    .padding(.leading, 7)
                    .padding(.top, -7)
                    .rotationEffect(.degrees(180))
                }
                
            }
//            Image(systemName: "suit.\(self.suit.rawValue).fill")
//                .foregroundColor(suitColor())
//                .font(.system(.largeTitle, design: .serif))
            CardDesign(rawValue: value)?.of(suit: self.suit)
        }
    }
}

private struct CardBack: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.defaultColor, lineWidth: 10))
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 4))
            Image(systemName: "sun.min.fill")
                .foregroundColor(Color.defaultColor)
                .font(.largeTitle)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(card: .example, flipState: .faceUp, cardState: .deck)
                .padding()
            CardView(card: .example, flipState: .faceDown, cardState: .deck)
        }//.previewLayout(.fixed(width: 568, height: 320))
    }
}

extension Color {
    public static let defaultColor: Color = Color.init(UIColor.systemBackground)
}
