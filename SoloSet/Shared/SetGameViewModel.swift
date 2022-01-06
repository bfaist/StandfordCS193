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
    
    struct Constants {
        static let numberOfCardsToDeal = 12
        static let numberOfCardsInSet = 3
    }
    
    @Published private(set) var cards: [Card] = []
    
    private var allCards: [Card] = []
    private var selectedCards: [Card] = []
    private var matchedIndicies: [Int] = []
    private var allMatchedCards: [Card] = []
    
    var matchedSetCount: Int {
        allMatchedCards.count / Constants.numberOfCardsInSet
    }
    
    func newGameTapped() {
        cards.removeAll()
        selectedCards.removeAll()
        matchedIndicies.removeAll()
        allMatchedCards.removeAll()
        dealCards(numCards: Constants.numberOfCardsToDeal)
    }
    
    func dealMoreCardsTapped() {
        dealCards(numCards: cards.count + Constants.numberOfCardsInSet)
    }
    
    init() {
        makeAllCards()
    }
    
    func checkForMatches() {
        selectedCards.removeAll()
        var selectedIndices: [Int] = []
        
        for (index, card) in cards.enumerated() {
            // if card is not in a valid set, mark it and unselect
            if cards[index].isNotInSet {
                cards[index].isNotInSet = false
            }
            
            // if card is selected, save it to determine if in a set
            if cards[index].isSelected {
                selectedIndices.append(index)
                selectedCards.append(card)
            }
        }
        
        if matchedIndicies.count == Constants.numberOfCardsInSet {
            matchedIndicies.forEach { dealANewCard(at: $0) }
            matchedIndicies.removeAll()
            return
        }
        
        guard selectedCards.count == Constants.numberOfCardsInSet else { return }
        
        guard areSelectedCardsASet else {
            markUnmatchedCards()
            return
        }
        
        selectedCards.forEach { card in
            card.isMatched = true
            card.isSelected = false
            allMatchedCards.append(card)
        }
        
        selectedIndices.forEach { matchedIndicies.append($0) }
    }
    
    private var areSelectedCardsASet: Bool {
        (haveSameColor()  || haveDifferentColor()) &&
        (haveSameShape()  || haveDifferenShape()) &&
        (haveSameNumber() || haveDifferentNumber()) &&
        (haveSameFill()   || haveDifferentFill())
    }
    
    private func markUnmatchedCards() {
        selectedCards.forEach { card in
            card.isNotInSet = true
            card.isSelected = false
        }
    }
    
    private func dealCards(numCards: Int) {
        repeat {
            dealANewCard(at: nil)
        } while cards.count < numCards
    }
    
    private func dealANewCard(at index: Int?) {
        var foundAValidCard = false
        
        repeat {
            if let newCard = allCards.filter({ !$0.isMatched && !$0.isSelected }).randomElement() {
                if !cards.contains(where: { $0 == newCard }) {
                    if let index = index {
                        cards[index] = newCard
                    } else {
                        cards.append(newCard)
                    }
                    foundAValidCard = true
                }
            }
        } while foundAValidCard == false
    }
    
    private func haveSameNumber() -> Bool {
        selectedCards[0].numShapes == selectedCards[1].numShapes &&
        selectedCards[1].numShapes == selectedCards[2].numShapes &&
        selectedCards[2].numShapes == selectedCards[0].numShapes
    }
    
    private func haveSameShape() -> Bool {
        selectedCards[0].shape == selectedCards[1].shape &&
        selectedCards[1].shape == selectedCards[2].shape &&
        selectedCards[2].shape == selectedCards[0].shape
    }
    
    private func haveSameColor() -> Bool {
        selectedCards[0].color == selectedCards[1].color &&
        selectedCards[1].color == selectedCards[2].color &&
        selectedCards[2].color == selectedCards[0].color
    }
    
    private func haveSameFill() -> Bool {
        selectedCards[0].fillType == selectedCards[1].fillType &&
        selectedCards[1].fillType == selectedCards[2].fillType &&
        selectedCards[2].fillType == selectedCards[0].fillType
    }
    
    private func haveDifferentNumber() -> Bool {
        selectedCards[0].numShapes != selectedCards[1].numShapes &&
        selectedCards[1].numShapes != selectedCards[2].numShapes &&
        selectedCards[2].numShapes != selectedCards[0].numShapes
    }
    
    private func haveDifferenShape() -> Bool {
        selectedCards[0].shape != selectedCards[1].shape &&
        selectedCards[1].shape != selectedCards[2].shape &&
        selectedCards[2].shape != selectedCards[0].shape
    }
    
    private func haveDifferentColor() -> Bool {
        selectedCards[0].color != selectedCards[1].color &&
        selectedCards[1].color != selectedCards[2].color &&
        selectedCards[2].color != selectedCards[0].color
    }
    
    private func haveDifferentFill() -> Bool {
        selectedCards[0].fillType != selectedCards[1].fillType &&
        selectedCards[1].fillType != selectedCards[2].fillType &&
        selectedCards[2].fillType != selectedCards[0].fillType
    }
    
    private func makeAllCards() {
        [Color.red, Color.purple, Color.blue].forEach { color in
            Card.FillType.allCases.forEach { fillType in
                Card.ShapeType.allCases.forEach { shapeType in
                    for numShapes in 1...3 {
                        allCards.append(Card.init(shape: shapeType, color: color, fillType: fillType, numShapes: numShapes))
                    }
                }
            }
        }

        print("Made \(allCards.count) possible cards")
    }
}
