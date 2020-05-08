////
////  OldLayout.swift
////  Solitaire
////
////  Created by Andrew Hocking on 2020-04-30.
////  Copyright © 2020 Andrew Hocking. All rights reserved.
////
//
//import SwiftUI
//
//struct PlacedCard: View {
//    let view: AnyView
//    let i: Int
//    let j: Int
//    @State var scale: Double = 1
//    @State var frames: [[CGRect]]
//
//    var body: some View {
//        view
//            .offset(x: CGFloat(Double(i * 175) * scale), y: CGFloat(Double(j * 60) * scale))
//            .overlay(
//                GeometryReader { geo in
//                    Color.clear
//                        .onAppear {
//                            self.frames[self.i][self.j] = geo.frame(in: .named("Tableau"))
//                            print("Added: (\(self.i), \(self.j)) at (\(geo.frame(in: .named("Tableau")).origin.x), \(geo.frame(in: .named("Tableau")).origin.y))")
//                        }
//                }
//            )
//    }
//}
//
//struct PlaceHolder: View {
//    var suit: Suit?
//    @State var scale: Double = 1
//    var offsetX: Double = 0
//    var offsetY: Double = 0
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(Color.defaultColor.opacity(0.8), lineWidth: 8)
//                .frame(width: 140, height: 198)
//            Image(systemName: "suit.\((self.suit ?? Suit.heart).rawValue).fill")
//                .foregroundColor(Color.defaultColor.opacity(self.suit != nil ? 0.8 : 0))
//                .font(.largeTitle)
//                .offset(x: 0, y: suit == .heart ? 3 : 0)
//                .scaleEffect(1.5)
//        }
//        .scaleEffect(CGFloat(scale))
//        .offset(x: CGFloat(scale * offsetX * 175), y: 0)
//    }
//}
//
//
//struct OldLayout: View {
//    @ObservedObject var cardStack = Deck()
//
//    @State var cardScale = 0.8
//    @State var colorChoice = 2
//    @State var buttonFrames = [[CGRect]](repeating: [CGRect](repeating: .zero, count: 19), count: 7)
//
//    var body: some View {
//        HStack {
//            Sidebar(colorChoice: colorChoice, cardScale: cardScale)
//
//            ZStack (alignment: .topLeading) {
//                PlaceHolder(suit: .club, scale: self.cardScale, offsetX: 3)
//                    .padding()
//                PlaceHolder(suit: .heart, scale: self.cardScale, offsetX: 4)
//                    .padding()
//                PlaceHolder(suit: .spade, scale: self.cardScale, offsetX: 5)
//                    .padding()
//                PlaceHolder(suit: .diamond, scale: self.cardScale, offsetX: 6)
//                    .padding()
//                ForEach (0..<7) { i in
//                    PlaceHolder(scale: self.cardScale, offsetX: Double(i))
//                    ForEach (0..<i) { j in
//                        PlacedCard(view: AnyView(self.cardStack.draw(scale: self.cardScale, onChanged: self.letterMoved)), i: i, j: j, scale: self.cardScale, frames: self.buttonFrames)
//                            .coordinateSpace(name: "Tableau")
//                    }
//                    PlacedCard(view: AnyView(self.cardStack.draw(flipState: .faceUp, scale: self.cardScale, onChanged: self.letterMoved)), i: i, j: i, scale: self.cardScale, frames: self.buttonFrames)
//                        .coordinateSpace(name: "Tableau")
//                }
//                .offset(x: 0, y: 250)
//                .padding()
//                Group {
//                    PlaceHolder(scale: self.cardScale, offsetX: 1)
//                    ForEach (0..<3) { i in
//                        self.cardStack.draw(flipState: .faceUp, scale: self.cardScale, onChanged: self.letterMoved)
//                            .offset(x: CGFloat(self.cardScale * Double(175 + (i * 30))), y: 0)
//                    }
//                    ForEach (0..<5) { i in
//                        self.cardStack.draw(scale: self.cardScale, onChanged: self.letterMoved)
//                            .offset(x: 0, y: CGFloat(-i))
//                    }
//                    ForEach (0..<self.cardStack.allCards.count) { i in
//                        self.cardStack.draw(shadow: false, scale: self.cardScale, onChanged: self.letterMoved)
//                            .offset(x: 0, y: CGFloat((-i) + 5))
//                    }
//                }
//                    .padding()
//            }
//                .padding()
//        }
//    }
//
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
//}
//
//struct OldLayout_Previews: PreviewProvider {
//    static var previews: some View {
//        OldLayout()
//    }
//}
