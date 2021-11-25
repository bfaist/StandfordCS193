//
//  GameGridView.swift
//  CS193Homework2
//
//  Created by Robert Faist on 11/23/21.
//

import SwiftUI

struct GameGridView: View {
    let viewModel: GameGridViewModel
    
    @State var currentCardTheme: CardTheme = CardTheme.foodTheme
    
    var body: some View {
        VStack {
            Text(viewModel.gameTitle).font(.title)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: viewModel.cardWidthMinimum))]) {
                ForEach(currentCardTheme.emojis.shuffled(), id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(viewModel.cardAspectRatio, contentMode: .fill)
                }
            }
            Spacer()
            HStack(alignment: .bottom) {
                ForEach(viewModel.allCardThemes) { theme in
                    Button(action: {
                        currentCardTheme = theme
                    }, label: {
                        VStack(alignment: .center) {
                            Image(systemName: theme.selectionImageName)
                                .font(.largeTitle)
                            Text(theme.title)
                                .font(.body)
                        }
                        .padding()
                    })
                }
            }
        }
    }
}

struct GameGridView_Previews: PreviewProvider {
    static var previews: some View {
        GameGridView(viewModel: GameGridViewModel(), currentCardTheme: CardTheme.animalTheme)
    }
}
