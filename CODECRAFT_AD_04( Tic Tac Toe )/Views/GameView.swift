//
//  GameView.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var showResultView = false
    
    var body: some View {
        ZStack {
            // Main game content
            VStack {
                ScoreView(xScore: viewModel.xScore, oScore: viewModel.oScore)
                    .padding()
                
                Spacer()
                
                GameBoardView(viewModel: viewModel)
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                
                Spacer()
                
                GameStatusView(viewModel: viewModel)
                
                Button(action: {
                    withAnimation {
                        viewModel.resetGame()
                    }
                }) {
                    Text("Restart Game")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .disabled(showResultView)
            .blur(radius: showResultView ? 3 : 0)
            
            // Game Result View overlay
            if showResultView {
                GameResultView(result: viewModel.gameState, onRestart: {
                    withAnimation {
                        viewModel.resetGame()
                        showResultView = false
                    }
                })
                .transition(.scale.combined(with: .opacity))
                .zIndex(1)
            }
        }
        .onChange(of: viewModel.gameState) { _, newState in
            if case .ongoing = newState {
                showResultView = false
            } else {
                withAnimation {
                    showResultView = true
                }
            }
        }
    }
}
