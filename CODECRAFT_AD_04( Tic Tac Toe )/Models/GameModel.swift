//
//  Untitled.swift
//  CODECRAFT_AD_04( Tic Tac Toe )
//
//  Created by shashika theekshana on BE 2568-07-26.
//

import Foundation

enum Player: String {
    case x = "X"
    case o = "O"
    
    var next: Player {
        switch self {
        case .x: return .o
        case .o: return .x
        }
    }
}

enum GameState {
    case ongoing
    case draw
    case win(Player)
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        player.rawValue
    }
}

struct GameBoard {
    private(set) var moves: [Move?] = Array(repeating: nil, count: 9)
    
    subscript(index: Int) -> Move? {
        moves[index]
    }
    
    mutating func makeMove(at index: Int, by player: Player) {
        guard moves[index] == nil else { return }
        moves[index] = Move(player: player, boardIndex: index)
    }
    
    func isSquareOccupied(at index: Int) -> Bool {
        moves[index] != nil
    }
    
    func checkWinCondition(for player: Player) -> Bool {
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
            [0, 4, 8], [2, 4, 6]             // diagonals
        ]
        
        let playerPositions = moves.compactMap { $0 }.filter { $0.player == player }.map { $0.boardIndex }
        let playerPositionsSet = Set(playerPositions)
        
        return winPatterns.contains { $0.isSubset(of: playerPositionsSet) }
    }
    
    func checkDrawCondition() -> Bool {
        moves.compactMap { $0 }.count == 9
    }
    
    func winningIndices(for player: Player) -> [Int]? {
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
            [0, 4, 8], [2, 4, 6]             // diagonals
        ]
        
        let playerPositions = moves.compactMap { $0 }.filter { $0.player == player }.map { $0.boardIndex }
        let playerPositionsSet = Set(playerPositions)
        
        for pattern in winPatterns {
            if pattern.isSubset(of: playerPositionsSet) {
                return Array(pattern)
            }
        }
        
        return nil
    }
}
