//
//  GameResultView.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import SwiftUI

struct GameResultView: View {
    let result: GameState
    let onRestart: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(resultTitle)
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            Button(action: onRestart) {
                Text("Play Again")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.9))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(40)
    }
    
    private var resultTitle: String {
        switch result {
        case .win(let player):
            return "\(player.rawValue) Wins!"
        case .draw:
            return "It's a Draw!"
        case .ongoing:
            return "Game Over"
        }
    }
}
