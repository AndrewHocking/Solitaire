//
//  Tableau.swift
//  Solitaire
//
//  Created by Andrew Hocking on 2020-05-04.
//  Copyright © 2020 Andrew Hocking. All rights reserved.
//

import SwiftUI
import Combine

class Tableau: Combine.ObservableObject {
    @Published var cards = [[Card]]()
    @Published private var column0 = [Card]()
    @Published private var column1 = [Card]()
    @Published private var column2 = [Card]()
    @Published private var column3 = [Card]()
    @Published private var column4 = [Card]()
    @Published private var column5 = [Card]()
    @Published private var column6 = [Card]()
    
    let objectWillChange = ObservableObjectPublisher()
    
    init() {
        self.cards.append(contentsOf: [self.column0, self.column1, self.column2, self.column3, self.column4, self.column5, self.column6])
    }
    
    func printCards() -> Void {
        print("")
        for i in (0..<self.cards.count).reversed() {
            for j in 0..<self.cards[i].count {
                let icon: String
                switch self.cards[i][j].suit {
                case .club:
                    icon = "♣️"
                    break
                case .heart:
                    icon = "♥️"
                    break
                case .spade:
                    icon = "♠️"
                    break
                case .diamond:
                    icon = "♦️"
                    break
                }
                var letter: String {
                    if self.cards[i][j].value > 1 && self.cards[i][j].value < 11 {
                        return "\(self.cards[i][j].value)"
                    } else if self.cards[i][j].value == 1 {
                        return "A"
                    } else if self.cards[i][j].value == 11 {
                        return "J"
                    } else if self.cards[i][j].value == 12 {
                        return "Q"
                    } else if self.cards[i][j].value == 13 {
                        return "K"
                    } else {
                        return "ERROR"
                    }
                }
                print("\(letter)\(icon)", terminator: " \t")
            }
            print("")
        }
    }
}

//struct TableauView: View {
//    @EnvironmentObject var deck: Deck
//    @EnvironmentObject var tableau: Tableau
//
//    var body: some View {
//        HStack (alignment: .top) {
//            ForEach(0..<7) { i in
//                ZStack (alignment: .top) {
//                    PlaceHolder()
//                    VStack (alignment: .trailing, spacing: -185) {
//                        ForEach(0..<i+13) { j in
//                            if j <= self.numberOfCardsIn(column: i) {
//                                CardView(card: self.tableau.cards[i][j], flipState: j < self.numberOfCardsIn(column: i) ? FlipState.faceDown : FlipState.faceUp, cardState: CardState.tableau)
//                                    .stacked(at: j, in: self.tableau.cards[i].count, by: -40)
//                                    .shadow(color: Color.black.opacity(0.15), radius: 10)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    private func numberOfCardsIn(column: Int) -> Int {
//        return self.tableau.cards[column].count - 1
//    }
//}
