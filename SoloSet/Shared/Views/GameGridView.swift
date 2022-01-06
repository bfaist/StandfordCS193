//
//  GameGridView.swift
//  SoloSet
//
//  Created by Robert Faist on 12/15/21.
//

import SwiftUI

struct GameGridView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                newGameButton
                dealCardsButton
                Spacer()
                matchedSetsCounter
            }
            .padding()
            Spacer()
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                makeCardView(for: card)
                    .onTapGesture {
                        card.isSelected.toggle()
                        viewModel.checkForMatches()
                    }
            }
        }.padding(.top, 20)
    }
    
    private var matchedSetsCounter: some View {
        Text("\(viewModel.matchedSetCount)")
            .font(.largeTitle)
    }
    
    private var newGameButton: some View {
        Button {
            viewModel.newGameTapped()
        } label: {
            Text(SetGameViewModel.Labels.newGameButton)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(20)
        }
    }
    
    private var dealCardsButton: some View {
        Button {
            viewModel.dealMoreCardsTapped()
        } label: {
            Text(SetGameViewModel.Labels.dealCardsButton)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(20)
        }
    }
    
    @ViewBuilder
    private func makeCardView(for card: Card) -> some View {
        switch card.shape {
        case .rectangle:
            CardView<Rectangle>.makeRectangleCard(card: card)
        case .ellipse:
            CardView<Ellipse>.makeEllipseCard(card: card)
        case .diamond:
            CardView<DiamondShape>.makeDiamondCard(card: card)
        }
    }
}

struct GameGridView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SetGameViewModel()
        GameGridView(viewModel: viewModel)
    }
}
