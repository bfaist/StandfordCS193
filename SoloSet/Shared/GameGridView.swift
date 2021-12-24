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
                Button {
                    viewModel.newGameTapped()
                } label: {
                    newGameButton
                }
                
                Button {
                    viewModel.dealMoreCardsTapped()
                } label: {
                    dealCardsButton
                }
            }
            Spacer()
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                switch card.type {
                case .rectangle:
                    CardView<Rectangle>.makeRectangleCard(color: card.color,
                                                          fillType: card.fillType,
                                                          numShapes: card.numShapes)
                case .ellipse:
                    CardView<Ellipse>.makeEllipseCard(color: card.color,
                                                      fillType: card.fillType,
                                                      numShapes: card.numShapes)
                case .diamond:
                    CardView<DiamondShape>.makeDiamondCard(color: card.color,
                                                           fillType: card.fillType,
                                                           numShapes: card.numShapes)
                }
            }
        }.padding(.top, 20)
    }
    
    private var newGameButton: some View {
        Text(SetGameViewModel.Labels.newGameButton)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(20)
    }
    
    private var dealCardsButton: some View {
        Text(SetGameViewModel.Labels.dealCardsButton)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(20)
    }
}

struct GameGridView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SetGameViewModel()
        GameGridView(viewModel: viewModel)
    }
}
