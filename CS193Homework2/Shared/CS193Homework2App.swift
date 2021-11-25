//
//  CS193Homework2App.swift
//  Shared
//
//  Created by Robert Faist on 11/23/21.
//

import SwiftUI

@main
struct CS193Homework2App: App {
    var body: some Scene {
        WindowGroup {
            GameGridView(viewModel: GameGridViewModel())
        }
    }
}
