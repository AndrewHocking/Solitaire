//
//  Foundation.swift
//  Solitaire
//
//  Created by Andrew Hocking on 2020-05-04.
//  Copyright © 2020 Andrew Hocking. All rights reserved.
//

import SwiftUI

class Foundation: ObservableObject {
    @Published var clubs = [Card]()
    @Published var hearts = [Card]()
    @Published var spades = [Card]()
    @Published var diamonds = [Card]()
    
    init(clubs: [Card] = [], hearts: [Card] = [], spades: [Card] = [], diamonds: [Card] = []) {
        self.clubs = clubs
        self.hearts = hearts
        self.spades = spades
        self.diamonds = diamonds
    }
    
    func addToPile(card: Card) -> Void {
        switch card.suit {
        case .club:
            self.clubs.append(card)
            return
        case .heart:
            self.hearts.append(card)
            return
        case .spade:
            self.spades.append(card)
            return
        case .diamond:
            self.diamonds.append(card)
            return
        }
    }
    
    func topCard(suit: Suit) -> Card? {
        switch suit {
        case .club:
            return self.clubs.last
        case .heart:
            return self.hearts.last
        case .spade:
            return self.spades.last
        case .diamond:
            return self.diamonds.last
        }
    }
}

//struct FoundationView: View {
//    @EnvironmentObject var foundation: Foundation
//
//    var body: some View {
//        HStack {
//            ZStack {
//                PlaceHolder(suit: .club)
//                ForEach(0..<foundation.clubs.count, id: \.self) { index in
//                    CardView(card: self.foundation.clubs[index], flipState: .faceUp, cardState: CardState.foundation)
//                        .stacked(at: index, in: self.foundation.clubs.count, by: 3)
//                        .shadow(color: Color.black.opacity(0.15), radius: 10)
//                        .allowsHitTesting(false)
//                }
//            }
//            ZStack {
//                PlaceHolder(suit: .heart)
//                ForEach(0..<foundation.hearts.count, id: \.self) { index in
//                    CardView(card: self.foundation.hearts[index], flipState: .faceUp, cardState: CardState.foundation)
//                        .stacked(at: index, in: self.foundation.hearts.count, by: 3)
//                        .shadow(color: Color.black.opacity(0.15), radius: 10)
//                        .allowsHitTesting(false)
//                }
//            }
//            ZStack {
//                PlaceHolder(suit: .spade)
//                ForEach(0..<foundation.spades.count, id: \.self) { index in
//                    CardView(card: self.foundation.spades[index], flipState: .faceUp, cardState: CardState.foundation)
//                        .stacked(at: index, in: self.foundation.spades.count, by: 3)
//                        .shadow(color: Color.black.opacity(0.15), radius: 10)
//                        .allowsHitTesting(false)
//                }
//            }
//            ZStack {
//                PlaceHolder(suit: .diamond)
//                ForEach(0..<foundation.diamonds.count, id: \.self) { index in
//                    CardView(card: self.foundation.diamonds[index], flipState: .faceUp, cardState: CardState.foundation)
//                        .stacked(at: index, in: self.foundation.diamonds.count, by: 3)
//                        .shadow(color: Color.black.opacity(0.15), radius: 10)
//                        .allowsHitTesting(false)
//                }
//            }
//        }
//    }
//}
