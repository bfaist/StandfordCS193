//
//  CardView.swift
//  SoloSet
//
//  Created by Robert Faist on 12/15/21.
//

import SwiftUI

enum CardViewState {
    case unselected
    case selected
    case matched
    case mismatched
    
    var color: Color {
        switch self {
        case .unselected:
            return Color.black
        case .selected:
            return Color.blue
        case .matched:
            return Color.green
        case .mismatched:
            return Color.red
        }
    }
}

struct CardView<Symbol: Shape>: View {
    var symbol: Symbol
    var fillColor: Color
    var padding: CGFloat = 20
    var fillType: Card.FillType
    var numShapes: Int = 1
    
    @State var cardState: CardViewState = .unselected
    
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 20)
        
        ZStack {
            rect.fill(.white)
            rect.strokeBorder(cardState.color, lineWidth: 4)
            HStack {
                ForEach(0..<numShapes) { shapeIndex in
                    switch fillType {
                    case .solid:
                        symbol.padding(.vertical, padding)
                            .foregroundColor(fillColor)
                    case .hollow:
                        symbol.stroke(lineWidth: 4)
                            .padding(.vertical, padding)
                            .foregroundColor(fillColor)
                    case .light:
                        symbol.padding(.vertical, padding)
                            .foregroundColor(fillColor)
                            .opacity(0.6)
                    }
                }
            }.padding()
        }
        .cornerRadius(20)
        .padding(.all, 4)
        .onTapGesture {
            if cardState == .unselected {
                cardState = .selected
            } else if cardState == .selected {
                cardState = .unselected
            }
        }
    }
}

extension CardView {
    static func makeDiamondCard(color: Color,
                                fillType: Card.FillType,
                                numShapes: Int = 1) -> CardView {
        CardView(symbol: DiamondShape() as! Symbol,
                 fillColor: color,
                 fillType: fillType,
                 numShapes: numShapes
        )
    }
    static func makeRectangleCard(color: Color,
                                  fillType: Card.FillType,
                                  numShapes: Int = 1) -> CardView {
        CardView(symbol: Rectangle() as! Symbol,
                 fillColor: color,
                 fillType: fillType,
                 numShapes: numShapes
        )
    }
    static func makeEllipseCard(color: Color,
                                fillType: Card.FillType,
                                numShapes: Int = 1) -> CardView {
        CardView(symbol: Ellipse() as! Symbol,
                 fillColor: color,
                 fillType: fillType,
                 numShapes: numShapes
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView<Ellipse>.makeEllipseCard(color: .blue, fillType: .solid)
        CardView<Ellipse>.makeEllipseCard(color: .blue, fillType: .solid, numShapes: 2)
        CardView<Ellipse>.makeEllipseCard(color: .blue, fillType: .solid, numShapes: 3)
        CardView<DiamondShape>.makeDiamondCard(color: .red, fillType: .hollow)
        CardView<Rectangle>.makeRectangleCard(color: .green, fillType: .light)
    }
}
