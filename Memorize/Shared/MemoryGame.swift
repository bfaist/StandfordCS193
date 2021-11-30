//
//  MemoryGame.swift
//  Memorize
//
//  Created by Robert Faist on 11/27/21.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card] = []
    
    private var indexOfOnlyFaceUpCard: Int?
    
    var theme: GameTheme?
    
    var score: Int = 0
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    score -= 1
                }
                indexOfOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(theme: GameTheme) {
        let themeCards = theme.cardContents.shuffled()
        
        let numberOfPairs = min(theme.numberOfPairsOfCards, theme.cardContents.count)
        
        for pairIndex in 0..<numberOfPairs {
            let cardContent = themeCards[pairIndex]
            cards.append(Card(content: cardContent, color: theme.cardColor))
            cards.append(Card(content: cardContent, color: theme.cardColor))
        }

        self.cards = cards.shuffled()
        self.theme = theme
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var color: String
        var id = UUID()
    }
    
    struct GameTheme: Identifiable {
        var id = UUID()
        var name: String
        var cardContents: [CardContent]
        var numberOfPairsOfCards: Int
        var cardColor: String
    }
}
