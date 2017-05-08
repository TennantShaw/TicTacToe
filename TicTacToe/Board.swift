//
//  Board.swift
//  TicTacToe
//
//  Created by Tennant Shaw on 4/21/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//
import Foundation

struct BoardState : CustomStringConvertible {
    typealias Storage = [Int:Symbol]
    var storage: Storage
    
    
    
    init(_ moves: Storage) {
        let validMoves = moves.filter { (key, _) in
            return key >= 0 && key <= 8
        }
        precondition(validMoves.count == moves.count, "invalid move given")
        
        self.storage = moves
    }
    
    var description: String {
        var rows: [String] = []
        
        //   0 | 1 | 2
        //  ---+---+---
        //   3 | 4 | 5
        //  ---+---+---
        //   6 | 7 | 8
        for row in 0..<3 {
            let rowOffset = row * 3
            let leftKey     = rowOffset + 0
            let centerKey   = rowOffset + 1
            let rightKey    = rowOffset + 2
            
            let left = storage[leftKey]
            let center = storage[centerKey]
            let right = storage[rightKey]
            
            let leftString = left?.description ?? " "
            let centerString = center?.description ?? " "
            let rightString = right?.description ?? " "
            
            rows.append(" \(leftString) | \(centerString) | \(rightString) \n")
        }
        
        return rows.joined(separator: "---+---+--- \n")
    }
}



func evaluate(_ moveSet: Set<Int>) -> Bool {
    
    let winningCombos: Set<Set<Int>> = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    return winningCombos.contains { winner in
        moveSet.isSuperset(of: winner)
    }
}

func splitMoves(_ allMoves: [Int: Symbol]) -> (x: Set<Int>, o: Set<Int>) {
    let seed: (x: Set<Int>, o: Set<Int>) = ([], [])
    
    return allMoves.reduce(seed) { (accum, element) in
        let (location, symbol) = element
        switch symbol {
        case .x:
            let newX = accum.x.union([location])
            return (newX, accum.o)
        case .o:
            let newO = accum.o.union([location])
            return (accum.x, newO)
        }
    }
}

func winner(moves: [Int: Symbol]) -> Symbol? {
    let (xMoves, oMoves) = splitMoves(moves)
    if evaluate(xMoves) {
        return .x
    } else if evaluate(oMoves) {
        return .o
    } else {
        return nil
    }
}

func tellWinner(winner: Symbol) -> String {
    if winner == Symbol.x {
        return "xName is the winner."
    } else if winner == Symbol.o {
        return "oName is the winner."
    } else {
        return "The game isn't over yet. Keep on playing."
    }
}


var moves: [Int: Symbol] = [:]
var gameBoard: BoardState = BoardState([:])

func playStart() {
    if winner(moves: moves) == nil {
    let choice = getChoiceFromUser(prompt: "Player x may start the game. Choose one of the following moves.\n",
                                   choices: [
                                    "TopLeft",
                                    "TopCenter",
                                    "TopRight",
                                    "MiddleLeft",
                                    "MiddleCenter",
                                    "MiddleRight",
                                    "BottomLeft",
                                    "BottomCenter",
                                    "BottomRight"
                                    
        ])
    
    switch choice {
    case "TopLeft":
        if gameBoard.storage.index(forKey: 0) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 0)
            moves.updateValue(.x, forKey: 0)
            print(gameBoard)
            playerOTurn()
        }
    case "TopCenter":
        if gameBoard.storage.index(forKey: 1) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 1)
            moves.updateValue(.x, forKey: 1)
            print(gameBoard)
            playerOTurn()
        }
    case "TopRight":
        if gameBoard.storage.index(forKey: 2) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 2)
            moves.updateValue(.x, forKey: 2)
            print(gameBoard)
            playerOTurn()
        }
    case "MiddleLeft":
        if gameBoard.storage.index(forKey: 3) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 3)
            moves.updateValue(.x, forKey: 3)
            print(gameBoard)
            playerOTurn()
        }
    case "MiddleCenter":
        if gameBoard.storage.index(forKey: 4) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 4)
            moves.updateValue(.x, forKey: 4)
            print(gameBoard)
            playerOTurn()
        }
    case "MiddleRight":
        if gameBoard.storage.index(forKey: 5) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 5)
            moves.updateValue(.x, forKey: 5)
            print(gameBoard)
            playerOTurn()
        }
    case "BottomLeft":
        if gameBoard.storage.index(forKey: 6) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 6)
            moves.updateValue(.x, forKey: 6)
            print(gameBoard)
            playerOTurn()
        }
    case "BottomCenter":
        if gameBoard.storage.index(forKey: 7) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 7)
            moves.updateValue(.x, forKey: 7)
            print(gameBoard)
            playerOTurn()
        }
    case "BottomRight":
        if gameBoard.storage.index(forKey: 8) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 8)
            moves.updateValue(.x, forKey: 8)
            print(gameBoard)
            playerOTurn()
        }
    default:
        print("Shouldn't reach this point.")
    }
    } else {
        print("The winner is the person playing: \(String(describing: winner(moves: moves)))")
        newGame()
    }
}

func playerOTurn() {
    if winner(moves: moves) == nil {
    let choice = getChoiceFromUser(prompt: "It is player o's turn. Please choose a move.\n",
                                   choices: [
                                    "TopLeft",
                                    "TopCenter",
                                    "TopRight",
                                    "MiddleLeft",
                                    "MiddleCenter",
                                    "MiddleRight",
                                    "BottomLeft",
                                    "BottomCenter",
                                    "BottomRight"
                                    
        ])
    
    switch choice {
    case "TopLeft":
        if gameBoard.storage.index(forKey: 0) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 0)
            moves.updateValue(.o, forKey: 0)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "TopCenter":
        if gameBoard.storage.index(forKey: 1) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 1)
            moves.updateValue(.o, forKey: 1)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "TopRight":
        if gameBoard.storage.index(forKey: 2) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 2)
            moves.updateValue(.o, forKey: 2)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "MiddleLeft":
        if gameBoard.storage.index(forKey: 3) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 3)
            moves.updateValue(.o, forKey: 3)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "MiddleCenter":
        if gameBoard.storage.index(forKey: 4) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 4)
            moves.updateValue(.o, forKey: 4)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "MiddleRight":
        if gameBoard.storage.index(forKey: 5) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 5)
            moves.updateValue(.o, forKey: 5)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "BottomLeft":
        if gameBoard.storage.index(forKey: 6) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 6)
            moves.updateValue(.o, forKey: 6)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "BottomCenter":
        if gameBoard.storage.index(forKey: 7) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 7)
            moves.updateValue(.o, forKey: 7)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    case "BottomRight":
        if gameBoard.storage.index(forKey: 8) == nil {
            gameBoard.storage.updateValue(Symbol.o, forKey: 8)
            moves.updateValue(.o, forKey: 8)
            print(gameBoard)
            playerXTurn()
        } else {
            print("That spot is already taken")
            playerOTurn()
        }
    default:
        print("Shouldn't reach this point.")
    }
    } else {
      print("The winner is the person playing: \(String(describing: winner(moves: moves)))")
        newGame()
    }
}

func playerXTurn() {
    if winner(moves: moves) == nil {
    let choice = getChoiceFromUser(prompt: "It is player x's turn. Please choose a move.\n",
                                   choices: [
                                    "TopLeft",
                                    "TopCenter",
                                    "TopRight",
                                    "MiddleLeft",
                                    "MiddleCenter",
                                    "MiddleRight",
                                    "BottomLeft",
                                    "BottomCenter",
                                    "BottomRight"
                                    
        ])
    
    switch choice {
    case "TopLeft":
        if gameBoard.storage.index(forKey: 0) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 0)
            moves.updateValue(.x, forKey: 0)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "TopCenter":
        if gameBoard.storage.index(forKey: 1) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 1)
            moves.updateValue(.x, forKey: 1)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "TopRight":
        if gameBoard.storage.index(forKey: 2) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 2)
            moves.updateValue(.x, forKey: 2)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "MiddleLeft":
        if gameBoard.storage.index(forKey: 3) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 3)
            moves.updateValue(.x, forKey: 3)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "MiddleCenter":
        if gameBoard.storage.index(forKey: 4) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 4)
            moves.updateValue(.x, forKey: 4)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "MiddleRight":
        if gameBoard.storage.index(forKey: 5) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 5)
            moves.updateValue(.x, forKey: 5)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "BottomLeft":
        if gameBoard.storage.index(forKey: 6) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 6)
            moves.updateValue(.x, forKey: 6)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "BottomCenter":
        if gameBoard.storage.index(forKey: 7) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 7)
            moves.updateValue(.x, forKey: 7)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    case "BottomRight":
        if gameBoard.storage.index(forKey: 8) == nil {
            gameBoard.storage.updateValue(Symbol.x, forKey: 8)
            moves.updateValue(.x, forKey: 8)
            print(gameBoard)
            playerOTurn()
        } else {
            print("That spot is already taken")
            playerXTurn()
        }
    default:
        print("Shouldn't reach this point.")
    }
    } else {
        print("The winner is the person playing: \(String(describing: winner(moves: moves)))")
        newGame()
    }
}

func newGame() {
    let choice = getChoiceFromUser(prompt: "Would you like to play again?\n",
                                   choices: [
                                    "Yes",
                                    "No"
                                    
        ])
    switch choice {
    case "Yes":
        gameBoard.storage.removeAll()
        moves.removeAll()
        playStart()
    default:
        print("Have a great day!")
        exit(0)
    }

}



