//
//  CardView.swift
//  SoloSet
//
//  Created by Robert Faist on 12/15/21.
//

import SwiftUI

struct CardView<Symbol: Shape>: View {
    var symbol: Symbol
    var padding: CGFloat = 10
    
    @ObservedObject var card: Card
    
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 20)
        
        ZStack {
            rect.fill(.white)
            rect.strokeBorder(card.borderColor, lineWidth: 4)
            HStack {
                ForEach(0..<card.numShapes, id: \.self) { shapeIndex in
                    switch card.fillType {
                    case .solid:
                        symbol.padding(.vertical, padding)
                            .foregroundColor(card.color)
                    case .hollow:
                        symbol.stroke(lineWidth: 4)
                            .padding(.vertical, padding)
                            .foregroundColor(card.color)
                    case .light:
                        symbol.padding(.vertical, padding)
                            .foregroundColor(card.color)
                            .opacity(0.6)
                    }
                }
            }.padding()
        }
        .cornerRadius(20)
        .padding(.all, 4)
    }
}

extension CardView {
    static func makeDiamondCard(card: Card) -> CardView {
        CardView(symbol: DiamondShape() as! Symbol, card: card)
    }
    static func makeRectangleCard(card: Card) -> CardView {
        CardView(symbol: Rectangle() as! Symbol, card: card)
    }
    static func makeEllipseCard(card: Card) -> CardView {
        CardView(symbol: Ellipse() as! Symbol, card: card)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView<Ellipse>.makeEllipseCard(card: Card(shape: .ellipse, color: .blue, fillType: .solid, numShapes: 1))
        CardView<Ellipse>.makeEllipseCard(card: Card(shape: .ellipse, color: .blue, fillType: .solid, numShapes: 2))
        CardView<Ellipse>.makeEllipseCard(card: Card(shape: .ellipse, color: .blue, fillType: .solid, numShapes: 3))
        CardView<DiamondShape>.makeDiamondCard(card: Card(shape: .diamond, color: .red, fillType: .light, numShapes: 1))
        CardView<DiamondShape>.makeDiamondCard(card: Card(shape: .diamond, color: .red, fillType: .hollow, numShapes: 2))
        CardView<DiamondShape>.makeDiamondCard(card: Card(shape: .diamond, color: .red, fillType: .solid, numShapes: 3))
        CardView<Rectangle>.makeRectangleCard(card: Card(shape: .rectangle, color: .green, fillType: .solid, numShapes: 1))
        CardView<Rectangle>.makeRectangleCard(card: Card(shape: .rectangle, color: .green, fillType: .solid, numShapes: 2))
        CardView<Rectangle>.makeRectangleCard(card: Card(shape: .rectangle, color: .green, fillType: .solid, numShapes: 3))
    }
}
