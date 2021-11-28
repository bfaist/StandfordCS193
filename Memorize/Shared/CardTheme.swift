//
//  CardTheme.swift
//  CS193Homework2
//
//  Created by Robert Faist on 11/24/21.
//

import Foundation

struct CardTheme: Identifiable {
    let id = UUID()
    let title: String
    let selectionImageName: String
    let emojis: [String]
}

extension CardTheme {
    static let animalTheme =
        CardTheme(title: "Animals",
                  selectionImageName: "tortoise",
                  emojis: ["🦄", "🐒", "🐓", "🐍", "🐷", "🦋", "🦀", "🐬", "🐪", "🐳"])
    static let foodTheme =
        CardTheme(title: "Food",
                  selectionImageName: "face.smiling",
                  emojis: ["🍔", "🥗", "🍨", "🍎", "🍿", "🌶", "🥦", "🥨"])
    static let sportsTheme =
        CardTheme(title: "Sports",
                  selectionImageName: "figure.walk",
                  emojis: ["⚽️", "🏀", "⚾️", "🎾", "🏐", "🎱", "⛳️", "🥊", "🏄‍♀️", "⛹️‍♀️"])
}
