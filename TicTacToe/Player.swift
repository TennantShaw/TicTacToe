//
//  Player.swift
//  TicTacToe
//
//  Created by Tennant Shaw on 4/21/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

struct Player : Equatable {
    var name: String
   
    public static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
}


func createPlayer(name: String, symbol: Symbol) -> Player? {
    if name.isEmpty {
        return nil
    } else {
        return Player(name: name)
    }
}
