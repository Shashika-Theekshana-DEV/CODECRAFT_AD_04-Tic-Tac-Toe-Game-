//
//  GameBoardView.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel: GameViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<9, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(viewModel.isSquareHighlighted(at: index) ?
                              Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                        .aspectRatio(1, contentMode: .fit)
                    
                    if let content = viewModel.squareContent(at: index) {
                        Text(content)
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(content == "X" ? .blue : .red)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        viewModel.makeMove(at: index)
                    }
                }
            }
        }
    }
}
