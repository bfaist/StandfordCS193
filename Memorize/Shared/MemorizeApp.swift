//
//  MemorizeApp.swift
//  Shared
//
//  Created by Robert Faist on 11/15/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            GameGridView(viewModel: EmojiMemoryGame())
        }
    }
}
