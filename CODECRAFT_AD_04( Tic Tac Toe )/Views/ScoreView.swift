//
//  ScoreView.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import SwiftUI

struct ScoreView: View {
    let xScore: Int
    let oScore: Int
    
    var body: some View {
        HStack {
            PlayerScoreView(player: .x, score: xScore)
            Spacer()
            PlayerScoreView(player: .o, score: oScore)
        }
        .padding(.horizontal)
    }
}

struct PlayerScoreView: View {
    let player: Player
    let score: Int
    
    var body: some View {
        VStack {
            Text(player.rawValue)
                .font(.title)
                .foregroundColor(player == .x ? .blue : .red)
            Text("\(score)")
                .font(.title2)
        }
    }
}
