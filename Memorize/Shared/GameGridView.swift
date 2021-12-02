//
//  GameGridView.swift
//  CS193Homework2
//
//  Created by Robert Faist on 11/23/21.
//

import SwiftUI

struct GameGridView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.newGameStart()
            }) {
                HStack {
                    Image(systemName: "gamecontroller")
                    Text(viewModel.newGameLabel)
                }.font(.title)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: viewModel.cardWidthMinimum))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card,
                                 cardColor: viewModel.cardColor(color: card.color))
                            .aspectRatio(viewModel.cardAspectRatio,
                                         contentMode: .fill)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .padding()
            }
            HStack {
                Text(viewModel.themeName)
                    .font(.title)
                Spacer()
                Text("Score: \(viewModel.score)")
                    .font(.title)
            }
            .padding()
        }
    }
}

struct GameGridView_Previews: PreviewProvider {
    static var previews: some View {
        GameGridView(viewModel: EmojiMemoryGame())
    }
}
