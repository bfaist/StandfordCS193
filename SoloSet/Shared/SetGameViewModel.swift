//
//  SetGameViewModel.swift
//  SoloSet
//
//  Created by Robert Faist on 12/15/21.
//

import Foundation
import SwiftUI

class SetGameViewModel: ObservableObject {
    struct Labels {
        static let newGameButton = "New Game"
        static let dealCardsButton = "Deal 3 More Cards"
    }
    
    private(set) var cards: [Card] = []
    
    func newGameTapped() {
        
    }
    
    func dealMoreCardsTapped() {
        
    }
    
    init() {
        cards = [
            Card(type: .diamond, color: .red, fillType: .solid, numShapes: 1),
            Card(type: .diamond, color: .red, fillType: .hollow, numShapes: 2),
            Card(type: .diamond, color: .red, fillType: .light, numShapes: 3),
            Card(type: .ellipse, color: .purple, fillType: .solid, numShapes: 1),
            Card(type: .ellipse, color: .purple, fillType: .hollow, numShapes: 2),
            Card(type: .ellipse, color: .purple, fillType: .light, numShapes: 3),
            Card(type: .rectangle, color: .blue, fillType: .solid, numShapes: 1),
            Card(type: .rectangle, color: .blue, fillType: .hollow, numShapes: 2),
            Card(type: .rectangle, color: .blue, fillType: .light, numShapes: 3),
            Card(type: .diamond, color: .red, fillType: .light, numShapes: 1),
            Card(type: .diamond, color: .red, fillType: .hollow, numShapes: 2),
            Card(type: .diamond, color: .red, fillType: .solid, numShapes: 3)
        ]
    }
    
    
}
