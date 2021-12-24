//
//  SoloSetApp.swift
//  Shared
//
//  Created by Robert Faist on 12/15/21.
//

import SwiftUI

@main
struct SoloSetApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SetGameViewModel()
            GameGridView(viewModel: viewModel)
        }
    }
}
