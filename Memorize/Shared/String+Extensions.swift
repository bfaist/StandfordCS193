//
//  String+Extensions.swift
//  Memorize
//
//  Created by Robert Faist on 11/29/21.
//

import SwiftUI

extension String {
    func mapToColor() -> Color? {
        switch self.lowercased() {
        case "red":
            return Color.red
        case "yellow":
            return Color.yellow
        case "orange":
            return Color.orange
        case "blue":
            return Color.blue
        case "green":
            return Color.green
        case "purple":
            return Color.purple
        default:
            return nil
        }
    }
}
