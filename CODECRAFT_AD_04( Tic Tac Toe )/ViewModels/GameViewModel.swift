//
//  GameViewModel.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published private var gameBoard = GameBoard()
    @Published private(set) var currentPlayer: Player = .x
    @Published private(set) var gameState: GameState = .ongoing
    @Published private(set) var winningIndices: [Int]?
    
    @Published private(set) var xScore: Int = 0
    @Published private(set) var oScore: Int = 0
    
    func makeMove(at index: Int) {
        guard gameState == .ongoing else { return }
        guard !gameBoard.isSquareOccupied(at: index) else { return }
        
        gameBoard.makeMove(at: index, by: currentPlayer)
        
        if gameBoard.checkWinCondition(for: currentPlayer) {
            gameState = .win(currentPlayer)
            winningIndices = gameBoard.winningIndices(for: currentPlayer)
            updateScore(for: currentPlayer)
        } else if gameBoard.checkDrawCondition() {
            gameState = .draw
        } else {
            currentPlayer = currentPlayer.next
        }
    }
    
    private func updateScore(for player: Player) {
        switch player {
        case .x: xScore += 1
        case .o: oScore += 1
        }
    }
    
    func resetGame() {
        gameBoard = GameBoard()
        currentPlayer = .x
        gameState = .ongoing
        winningIndices = nil
    }
    
    func squareContent(at index: Int) -> String? {
        gameBoard[index]?.indicator
    }
    
    func isSquareHighlighted(at index: Int) -> Bool {
        winningIndices?.contains(index) ?? false
    }
}
