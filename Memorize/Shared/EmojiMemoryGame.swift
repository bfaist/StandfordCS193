//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Robert Faist on 11/27/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let allThemes = [animalTheme, foodTheme, sportsTheme, vehicleTheme, toolTheme, heartTheme]
    
    @Published private var model: MemoryGame<String>?
    
    var cards: [MemoryGame<String>.Card] {
        model?.cards ?? []
    }
    
    var themeName: String {
        model?.theme?.name ?? ""
    }
    
    var score: Int {
        model?.score ?? 0
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model?.choose(card)
    }
    
    func newGameStart() {
        model = MemoryGame(theme: EmojiMemoryGame.allThemes.randomElement() ?? EmojiMemoryGame.animalTheme)
    }
    
    func cardColor(color: String) -> Color {
        color.mapToColor() ?? Color.black
    }
    
    let cardAspectRatio: CGFloat = 2/3
    let cardWidthMinimum: CGFloat = 80
    let newGameLabel = "New Game"
    
    init() {
        newGameStart()
    }
}

extension EmojiMemoryGame {
    static let animalTheme = MemoryGame<String>.GameTheme(name: "Animals",
                                                          cardContents: ["🦄", "🐒", "🐓", "🐍", "🐷", "🦋", "🦀", "🐬", "🐪", "🐳"],
                                                          numberOfPairsOfCards: 10,
                                                          cardColor: "red")
    
    static let foodTheme = MemoryGame<String>.GameTheme(name: "Food",
                                                        cardContents: ["🍔", "🥗", "🍨", "🍎", "🍿", "🌶", "🥦", "🥨"],
                                                        numberOfPairsOfCards: 7, cardColor: "blue")
    
    static let sportsTheme = MemoryGame<String>.GameTheme(name: "Sports",
                                                          cardContents: ["⚽️", "🏀", "⚾️", "🎾", "🏐", "🎱", "⛳️", "🥊", "🏄‍♀️", "⛹️‍♀️"],
                                                          numberOfPairsOfCards: 8, cardColor: "green")
    
    static let vehicleTheme = MemoryGame<String>.GameTheme(name: "Vehicles",
                                                          cardContents: ["🚗", "🚕", "🚌", "🏎", "🚑", "🚒", "🚛", "🛺", "🛵", "🚲"],
                                                          numberOfPairsOfCards: 10, cardColor: "yellow")
    
    static let toolTheme = MemoryGame<String>.GameTheme(name: "Tools",
                                                          cardContents: ["🪚", "🪛", "🛠", "🪓", "🪜", "🔪", "✂️"],
                                                          numberOfPairsOfCards: 10, cardColor: "orange")
    
    static let heartTheme = MemoryGame<String>.GameTheme(name: "Hearts",
                                                          cardContents: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤"],
                                                          numberOfPairsOfCards: 7, cardColor: "purple")
}
