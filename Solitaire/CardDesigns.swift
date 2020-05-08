//
//  CardDesigns.swift
//  Solitaire
//
//  Created by Andrew Hocking on 2020-04-25.
//  Copyright © 2020 Andrew Hocking. All rights reserved.
//

import SwiftUI

enum CardDesign: Int {
    case ace = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
    case joker = 14
    
    func of(suit: Suit) -> AnyView {
        switch self {
        case .ace:
            return AnyView(Ace(suit: suit))
        case .two:
            return AnyView(Two(suit: suit))
        case .three:
            return AnyView(Three(suit: suit))
        case .four:
            return AnyView(Four(suit: suit))
        case .five:
            return AnyView(Five(suit: suit))
        case .six:
            return AnyView(Six(suit: suit))
        case .seven:
            return AnyView(Seven(suit: suit))
        case .eight:
            return AnyView(Eight(suit: suit))
        case .nine:
            return AnyView(Nine(suit: suit))
        case .ten:
            return AnyView(Ten(suit: suit))
        case .jack:
            return AnyView(Jack(suit: suit))
        case .queen:
            return AnyView(Queen(suit: suit))
        case .king:
            return AnyView(King(suit: suit))
        case .joker:
            return AnyView(Joker(suit: suit))
        }
    }
}

private let suitSize = Font.TextStyle.title
private let suitScale: CGFloat = 0.95
private let fontDesign = Font.Design.serif

private struct Ace: View {
    var suit: Suit
    var body: some View {
        Image(systemName: "suit.\(self.suit.rawValue).fill")
            .foregroundColor(suit.color())
            .font(.system(.largeTitle, design: fontDesign))
            .scaleEffect(2.5)
            .offset(x: 0, y: suit == .heart ? 3 : 0)
    }
}

private struct Two: View {
    var suit: Suit
    var body: some View {
        VStack {
            Image(systemName: "suit.\(self.suit.rawValue).fill")
                .foregroundColor(suit.color())
                .font(.system(suitSize, design: fontDesign))
                .scaleEffect(suitScale)
                .offset(x: 0, y: suit == .heart ? 3 : 0)
            Spacer()
            Image(systemName: "suit.\(self.suit.rawValue).fill")
                .foregroundColor(suit.color())
                .font(.system(suitSize, design: fontDesign))
                .scaleEffect(suitScale)
                .offset(x: 0, y: suit == .heart ? 3 : 0)
                .rotationEffect(.degrees(180))
        }.padding(30)
    }
}

private struct Three: View {
    var suit: Suit
    var body: some View {
        VStack {
            Image(systemName: "suit.\(self.suit.rawValue).fill")
                .foregroundColor(suit.color())
                .font(.system(suitSize, design: fontDesign))
                .scaleEffect(suitScale)
                .offset(x: 0, y: suit == .heart ? 3 : 0)
            Spacer()
            Image(systemName: "suit.\(self.suit.rawValue).fill")
                .foregroundColor(suit.color())
                .font(.system(suitSize, design: fontDesign))
                .scaleEffect(suitScale)
                .offset(x: 0, y: suit == .heart ? 3 : 0)
            Spacer()
            Image(systemName: "suit.\(self.suit.rawValue).fill")
                .foregroundColor(suit.color())
                .font(.system(suitSize, design: fontDesign))
                .scaleEffect(suitScale)
                .offset(x: 0, y: suit == .heart ? 3 : 0)
                .rotationEffect(.degrees(180))
        }.padding(30)
    }
}

private struct Four: View {
    var suit: Suit
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
            }
                .padding([.top, .bottom], 30)
                .padding(.leading, 35)
            Spacer()
            VStack {
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
            }
                .padding([.top, .bottom], 30)
                .padding(.trailing, 35)
        }
    }
}

private struct Five: View {
    var suit: Suit
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.leading, 35)
                Spacer()
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.trailing, 35)
            }
            Image(systemName: "suit.\(self.suit.rawValue).fill")
                .foregroundColor(suit.color())
                .font(.system(suitSize, design: fontDesign))
                .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
        }
    }
}

private struct Six: View {
    var suit: Suit
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
            }
                .padding([.top, .bottom], 30)
                .padding(.leading, 35)
            Spacer()
            VStack {
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
            }
                .padding([.top, .bottom], 30)
                .padding(.trailing, 35)
        }
    }
}

private struct Seven: View {
    var suit: Suit
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.leading, 35)
                Spacer()
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.trailing, 35)
            }
            VStack {
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                    .frame(height: 40)
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
                    .hidden()
                Spacer()
            }
        }
    }
}

private struct Eight: View {
    var suit: Suit
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.leading, 35)
                Spacer()
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.trailing, 35)
            }
            VStack {
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                    .frame(height: 40)
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
                Spacer()
            }
        }
    }
}

private struct Nine: View {
    var suit: Suit
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.leading, 35)
                Spacer()
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.trailing, 35)
            }
            VStack {
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
            }
        }
    }
}

private struct Ten: View {
    var suit: Suit
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.leading, 35)
                Spacer()
                VStack {
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                    Spacer()
                    Image(systemName: "suit.\(self.suit.rawValue).fill")
                        .foregroundColor(suit.color())
                        .font(.system(suitSize, design: fontDesign))
                        .scaleEffect(suitScale)
                        .offset(x: 0, y: suit == .heart ? 3 : 0)
                        .rotationEffect(.degrees(180))
                }
                    .padding([.top, .bottom], 30)
                    .padding(.trailing, 35)
            }
            VStack {
                Spacer()
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                Spacer()
                    .frame(height: 62)
                Image(systemName: "suit.\(self.suit.rawValue).fill")
                    .foregroundColor(suit.color())
                    .font(.system(suitSize, design: fontDesign))
                    .scaleEffect(suitScale)
                    .offset(x: 0, y: suit == .heart ? 3 : 0)
                    .rotationEffect(.degrees(180))
                Spacer()
            }.padding(30)
        }
    }
}

private struct Jack: View {
    var suit: Suit
    var body: some View {
        ZStack {
            Ace(suit: suit)
            Text("J")
                .bold()
                .foregroundColor(Color.defaultColor)
                .font(.system(.largeTitle, design: fontDesign))
        }
    }
}

private struct Queen: View {
    var suit: Suit
    var body: some View {
        ZStack {
            Ace(suit: suit)
            Text("Q")
                .bold()
                .foregroundColor(Color.defaultColor)
                .font(.system(.largeTitle, design: fontDesign))
        }
    }
}

private struct King: View {
    var suit: Suit
    var body: some View {
        ZStack {
            Ace(suit: suit)
            Text("K")
                .bold()
                .foregroundColor(Color.defaultColor)
                .font(.system(.largeTitle, design: fontDesign))
        }
    }
}

private struct Joker: View {
    var suit: Suit
    var string: String = (Int.random(in: 0...1) == 1 ? "J" : "j") + (Int.random(in: 0...1) == 1 ? "O" : "o") + (Int.random(in: 0...1) == 1 ? "K" : "k") + (Int.random(in: 0...1) == 1 ? "E" : "e") + (Int.random(in: 0...1) == 1 ? "R" : "r")
    var body: some View {
        Text(string)
            .bold()
            .foregroundColor(suit.color())
            .font(.system(.largeTitle, design: fontDesign))
            .rotationEffect(.degrees(55))
    }
}


struct CardDesigns_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example, flipState: .faceUp, cardState: .deck)
    }
}
