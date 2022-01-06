//
//  Card.swift
//  SoloSet
//
//  Created by Robert Faist on 12/19/21.
//

import SwiftUI

class Card: ObservableObject, Identifiable, CustomStringConvertible {
    
    enum ShapeType: CaseIterable {
        case ellipse
        case rectangle
        case diamond
    }
    
    enum FillType: CaseIterable {
        case solid
        case hollow
        case light
    }
    
    let id = UUID()
    let shape: ShapeType
    let color: Color
    let fillType: FillType
    let numShapes: Int
    
    @Published var isMatched = false
    @Published var isSelected = false
    @Published var isNotInSet = false
    
    var description: String {
        "Card - [\(shape):\(color):\(fillType):\(numShapes)] SELECTED: \(isSelected) MATCHED: \(isMatched)"
    }
    
    init(shape: ShapeType, color: Color, fillType: FillType, numShapes: Int) {
        self.shape = shape
        self.color = color
        self.fillType = fillType
        self.numShapes = numShapes
    }
    
    var borderColor: Color {
        if isNotInSet {
            return Color.red
        } else if isSelected && !isMatched {
            return Color.blue
        } else if !isSelected && isMatched {
            return Color.green
        } else {
            return Color.black
        }
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.numShapes == rhs.numShapes &&
        lhs.color == rhs.color &&
        lhs.shape == rhs.shape &&
        lhs.fillType == rhs.fillType
    }
}
