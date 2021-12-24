//
//  DiamondShape.swift
//  SoloSet
//
//  Created by Robert Faist on 12/17/21.
//

import SwiftUI

struct DiamondShape: Shape {
    var hollowShape: Bool = false
    
    func path(in rect: CGRect) -> Path {
        
        let centerX = rect.minX + (rect.width / 2)
        let centerY = rect.minY + (rect.height / 2)
        let topCenter = CGPoint(x: centerX, y: rect.minY)
        let leftCenter = CGPoint(x: rect.minX, y: centerY)
        let bottomCenter = CGPoint(x: centerX, y: rect.maxY)
        let rightCenter = CGPoint(x: rect.maxX, y: centerY)
        
        var p = Path()
        p.move(to: topCenter)
        p.addLines([topCenter, leftCenter, bottomCenter, rightCenter, topCenter])
        
        return p
    }
}

