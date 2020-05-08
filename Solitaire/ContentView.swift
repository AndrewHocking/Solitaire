//
//  ContentView.swift
//  Solitaire
//
//  Created by Andrew Hocking on 2020-04-24.
//  Copyright © 2020 Andrew Hocking. All rights reserved.
//

import SwiftUI

struct Sidebar: View {
    @State var colorChoice: Int = 0
    @State var cardScale: Double = SceneDelegate.cardSize
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Solitaire")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.primary)
            Text("Color Scheme")
            Picker(selection: $colorChoice, label: Text("Color Scheme")) {
                Text("Light").tag(0)
                Text("Dark").tag(1)
                Text("System").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
            Text("Card Size")
            Slider(value: $cardScale, in: 0.3...2, step: 0.1)
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.defaultColor.opacity(0.7))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.8), radius: 5)
        .padding(50)
    }
}

struct PlaceHolder: View {
    var suit: Suit? = nil
    var width: CGFloat = 140
    var height: CGFloat = 198

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.defaultColor.opacity(0.8), lineWidth: 8)
                .frame(width: self.width, height: self.height)
            Image(systemName: "suit.\((self.suit ?? Suit.heart).rawValue).fill")
                .foregroundColor(Color.defaultColor.opacity(self.suit != nil ? 0.8 : 0))
                .font(.largeTitle)
                .offset(x: 0, y: suit == .heart ? 3 : 0)
                .scaleEffect(1.5)
        }
        .scaleEffect(CGFloat(SceneDelegate.cardSize))
    }
}


struct ContentView: View {
    @EnvironmentObject var deck: Deck
    @EnvironmentObject var stockPile: StockPile
    @EnvironmentObject var foundation: Foundation
    @EnvironmentObject var tableau: Tableau
    
    @State var foundationFrames = [CGRect](repeating: .zero, count: 4)
    @State var buttonFrames = [CGRect](repeating: .zero, count: 7)
        
    var body: some View {
        ZStack (alignment: .top) {
            Color("feltGreen").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Score: 0")
                        .font(.title)
                        .foregroundColor(Color.defaultColor)
                        .padding()
                    Button(action: {
                        self.resetGame()
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .font(.largeTitle)
                            .scaleEffect(1.5)
                            .foregroundColor(Color.defaultColor)
                            .padding()
                    }
                    Text("Time: 0")
                        .font(.title)
                        .foregroundColor(Color.defaultColor)
                        .padding()
                }
                .padding()
                VStack {
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        ZStack {
                            Spacer()
                                .frame(width: 175)
                            PlaceHolder()
                                .stacked(at: 0, in: self.deck.cards.count, by: 3)
                            Button(action: {
                                withAnimation(.linear(duration: 0.5)) {
                                    for _ in 0..<self.stockPile.cards.count {
                                       self.deck.cards.append(self.stockPile.cards.popLast()!)
                                    }
                                }
                            }) {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.defaultColor.opacity(0.8))
                            }
                            ForEach(0..<deck.cards.count, id: \.self) { index in
                                CardView(card: self.deck.cards[index], flipState: .faceDown, cardState: CardState.deck)
                                    .stacked(at: index, in: self.deck.cards.count, by: 3)
                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
                            }.padding()
                        }
                        Spacer()
                            .frame(width: 80)
                        ZStack {
                            Spacer()
                            .frame(width: 175)
                            ForEach(0..<stockPile.cards.count, id: \.self) { index in
                                CardView(card: self.stockPile.cards[index], flipState: .faceUp, cardState: CardState.stockPile)
                                    .stacked(at: index, in: self.stockPile.cards.count, by: 25, horizontal: true)
                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
                                    .allowsHitTesting(self.stockPile.cards.count - index == 1)
                            }.padding()
                        }
    //                    Spacer()
                        // Four foundation piles go here
                        ZStack {
                            PlaceHolder(suit: .club)
                            ForEach(0..<foundation.clubs.count, id: \.self) { index in
                                CardView(card: self.foundation.clubs[index], flipState: .faceUp, cardState: CardState.foundation)
                                    .stacked(at: index, in: self.foundation.clubs.count, by: 3)
                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
                                    .allowsHitTesting(false)
                            }
                        }
                        .overlay(
                            GeometryReader { geo in
                                Color.red.opacity(0.5)
                                    .onAppear {
                                        self.foundationFrames[0] = geo.frame(in: .global)
                                    }
                        })
                        ZStack {
                            PlaceHolder(suit: .heart)
                            ForEach(0..<foundation.hearts.count, id: \.self) { index in
                                CardView(card: self.foundation.hearts[index], flipState: .faceUp, cardState: CardState.foundation)
                                    .stacked(at: index, in: self.foundation.hearts.count, by: 3)
                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
                                    .allowsHitTesting(false)
                            }
                        }
                        .overlay(
                            GeometryReader { geo in
                                Color.red.opacity(0.5)
                                    .onAppear {
                                        self.foundationFrames[1] = geo.frame(in: .global)
                                    }
                        })
                        ZStack {
                            PlaceHolder(suit: .spade)
                            ForEach(0..<foundation.spades.count, id: \.self) { index in
                                CardView(card: self.foundation.spades[index], flipState: .faceUp, cardState: CardState.foundation)
                                    .stacked(at: index, in: self.foundation.spades.count, by: 3)
                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
                                    .allowsHitTesting(false)
                            }
                        }
                        .overlay(
                            GeometryReader { geo in
                                Color.red.opacity(0.5)
                                    .onAppear {
                                        self.foundationFrames[2] = geo.frame(in: .global)
                                    }
                        })
                        ZStack {
                            PlaceHolder(suit: .diamond)
                            ForEach(0..<foundation.diamonds.count, id: \.self) { index in
                                CardView(card: self.foundation.diamonds[index], flipState: .faceUp, cardState: CardState.foundation)
                                    .stacked(at: index, in: self.foundation.diamonds.count, by: 3)
                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
                                    .allowsHitTesting(false)
                            }
                        }
                        .overlay(
                            GeometryReader { geo in
                                Color.red.opacity(0.5)
                                    .onAppear {
                                        self.foundationFrames[3] = geo.frame(in: .global)
                                    }
                        })
                    }
                    .padding()
                    HStack (alignment: .top) {
                        ForEach(0..<7) { i in
    //                        if i != 0 {
    //                            Spacer()
    //                                .frame(minWidth: 0)
    //                        }
                            ZStack (alignment: .top) {
                                PlaceHolder()
                                VStack (alignment: .trailing, spacing: -185) {
                                    ForEach(0..<i+13) { j in
                                        if j <= self.numberOfCardsIn(column: i) { //self.tableau.cards[i].count
                                            CardView(card: self.tableau.cards[i][j], flipState: j < self.numberOfCardsIn(column: i) ? FlipState.faceDown : FlipState.faceUp, cardState: CardState.tableau, onChanged: self.letterMoved, onEnded: self.letterDropped)
                                                .stacked(at: j, in: self.tableau.cards[i].count, by: -40)
                                                .shadow(color: Color.black.opacity(0.15), radius: 10)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .padding()
                }
            }
        }
    }
    
    func resetGame() -> Void {
        self.deck.cards.append(contentsOf: self.stockPile.cards)
        for cards in self.tableau.cards {
            self.deck.cards.append(contentsOf: cards)
        }
        self.deck.cards.append(contentsOf: self.foundation.clubs)
        self.deck.cards.append(contentsOf: self.foundation.hearts)
        self.deck.cards.append(contentsOf: self.foundation.spades)
        self.deck.cards.append(contentsOf: self.foundation.diamonds)
        
        print("The deck has \(self.deck.cards.count) cards")
        
        self.tableau.cards = [[Card]](repeating: [Card](), count: 7)
        self.stockPile.cards = [Card]()
        self.foundation.clubs = [Card]()
        self.foundation.hearts = [Card]()
        self.foundation.spades = [Card]()
        self.foundation.diamonds = [Card]()
        
        self.deck.cards.shuffle()
        
        for i in 0..<7 {
            for _ in 0...i {
                self.tableau.cards[i].append(self.deck.cards.popLast()!)
            }
        }
        self.tableau.printCards()
    }
    
    func numberOfCardsIn(column: Int) -> Int {
        return self.tableau.cards[column].count - 1
    }
    
    func letterMoved(location: CGPoint, card: Card) -> DragState {
        if let _ = foundationFrames.firstIndex(where: { $0.contains(location) }) {
            if (self.foundation.topCard(suit: card.suit) ?? Card(value: 0, suit: card.suit)).value == card.value - 1 {
                return .good
            } else {
                return .bad
            }
        } else {
            return .unknown
        }
    }
    
    func letterDropped(location: CGPoint, card: Card) {
        if let _ = foundationFrames.firstIndex(where: { $0.contains(location) }) {
            if let c = card.findTableauIndex(tableau: self.tableau) {
                if self.tableau.cards[c.column].last == card {
                    self.foundation.addToPile(card: self.tableau.cards[c.column].popLast()!)
                }
            } else if self.stockPile.cards.last == card {
                self.foundation.addToPile(card: self.stockPile.cards.popLast()!)
            }

        }
    }
    
//    func letterMoved(location: CGPoint, value: Int, suit: Suit) -> DragState {
//        var frame: (Int, Int)? {
//            for i in 0..<buttonFrames.count {
//                for j in 0..<buttonFrames[i].count {
//                    if buttonFrames[i][j].contains(location) {
//                        print("\(i), \(j)")
//                        return (i, j)
//                    }
//                }
//            }
//            return nil
//        }
//
//        if let match = frame {
//            print("GOOD! -> (\(match.0), \(match.1))")
//            return .good
//        } else {
////            print("bad")
//            return .bad
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func stacked(at position: Int, in total: Int, by distance: CGFloat, horizontal: Bool = false) -> some View {
        let offset: CGFloat
        if horizontal {
            if total - position <= 3 {
                offset = CGFloat(total - position)
                return self.offset(CGSize(width: -offset * distance * CGFloat(SceneDelegate.cardSize), height: offset * 3 * CGFloat(SceneDelegate.cardSize) - CGFloat(total) * 3 * CGFloat(SceneDelegate.cardSize)))
            } else {
                offset = CGFloat(total - position)
                return self.offset(CGSize(width: -3 * distance * CGFloat(SceneDelegate.cardSize), height: offset * 3 * CGFloat(SceneDelegate.cardSize) - CGFloat(total) * 3 * CGFloat(SceneDelegate.cardSize)))
            }
        } else {
            offset = CGFloat(total - position)
            return self.offset(CGSize(width: 0, height: offset * distance * CGFloat(SceneDelegate.cardSize) - CGFloat(total) * distance * CGFloat(SceneDelegate.cardSize)))
        }
    }
}
