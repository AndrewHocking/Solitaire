//
//  Deck.swift
//  Solitaire
//
//  Created by Andrew Hocking on 2020-04-29.
//  Copyright © 2020 Andrew Hocking. All rights reserved.
//

import SwiftUI

//struct DeckAndStockPileView: View {
//    @EnvironmentObject var deck: Deck
//    @EnvironmentObject var stockPile: StockPile
//
//    var body: some View {
//        HStack {
//            ZStack {
//                Spacer()
//                    .frame(width: 175)
//                ForEach(0..<deck.cards.count, id: \.self) { index in
//                    CardView(card: self.deck.cards[index], flipState: .faceDown, cardState: CardState.deck)
//                        .stacked(at: index, in: self.deck.cards.count, by: 3)
//                        .shadow(color: Color.black.opacity(0.15), radius: 10)
//                }.padding()
//            }
//            Spacer()
//                .frame(width: 80)
//            ZStack {
//                Spacer()
//                .frame(width: 175)
//                ForEach(0..<stockPile.cards.count, id: \.self) { index in
//                    CardView(card: self.stockPile.cards[index], flipState: .faceUp, cardState: CardState.stockPile)
//                        .stacked(at: index, in: self.stockPile.cards.count, by: 25, horizontal: true)
//                        .shadow(color: Color.black.opacity(0.15), radius: 10)
//                        .allowsHitTesting(self.stockPile.cards.count - index == 1)
//                }.padding()
//            }
//        }
//    }
//}

class Deck: ObservableObject {
    @Published var cards: [Card]
    @EnvironmentObject var stockPile: StockPile
    
    init(cards c: [Card]? = nil, shuffled: Bool = true) {
        self.cards = [Card]()
        self.reset(cards: c, shuffled: shuffled)
    }

    func reset(cards c: [Card]? = nil, shuffled: Bool = true) -> Void {
        if let b = c {
            cards = b
        } else {
            cards = []
            for i in 1...13 {
                cards.append(Card(value: i, suit: .club))
            }
            for i in 1...13 {
                cards.append(Card(value: i, suit: .heart))
            }
            for i in 1...13 {
                cards.append(Card(value: i, suit: .spade))
            }
            for i in 1...13 {
                cards.append(Card(value: i, suit: .diamond))
            }
        }
        if shuffled {
            cards.shuffle()
        }
        print("\(cards.count) cards created")
    }
    
    func contains(_ card: Card) -> Bool {
        return cards.contains(card)
    }
    
    func moveTopToStockPile() -> Void {
        if let card = self.cards.popLast() {
            self.stockPile.cards.append(card)
        }
    }
}

class StockPile: ObservableObject {
    var cards = [Card]()
}
