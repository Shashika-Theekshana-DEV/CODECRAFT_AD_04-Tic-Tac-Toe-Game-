//
//  GameStatusView.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import SwiftUI

struct GameStatusView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Group {
            switch viewModel.gameState {
            case .ongoing:
                Text("Player \(viewModel.currentPlayer.rawValue)'s turn")
                    .font(.title)
                    .foregroundColor(viewModel.currentPlayer == .x ? .blue : .red)
            case .draw:
                Text("It's a draw!")
                    .font(.title)
                    .foregroundColor(.orange)
            case .win(let winner):
                Text("Player \(winner.rawValue) wins!")
                    .font(.title)
                    .foregroundColor(winner == .x ? .blue : .red)
            }
        }
        .padding()
        .transition(.opacity)
    }
}
