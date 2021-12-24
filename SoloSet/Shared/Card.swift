//
//  Card.swift
//  SoloSet
//
//  Created by Robert Faist on 12/19/21.
//

import SwiftUI

struct Card: Identifiable {
    enum ShapeType {
        case ellipse
        case rectangle
        case diamond
    }
    
    enum FillType {
        case solid
        case hollow
        case light
    }
    
    mutating func matchCard() {
        isMatched = true
    }
    
    mutating func selectCard() {
        isSelected = true
    }
    
    let id = UUID()
    let type: ShapeType
    let color: Color
    let fillType: FillType
    let numShapes: Int
    var isMatched = false
    var isSelected = false
}
