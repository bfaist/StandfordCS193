//
//  CardView.swift
//  CS193Homework2
//
//  Created by Robert Faist on 11/23/21.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    var cardColor: Color
    
    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                rect.fill(.white)
                rect.strokeBorder(cardColor, lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                rect.opacity(0)
            } else {
                rect.fill(cardColor)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(content: "X", color: "red"), cardColor: .red)
    }
}
