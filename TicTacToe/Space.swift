//
//  Space.swift
//  TicTacToe
//
//  Created by Tennant Shaw on 5/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

enum Space {
    case x
    case o
    case e // for 'empty'
    
    init(symbol: Symbol) {
        switch symbol {
        case .x:
            self = .x
        case .o:
            self = .o
        }
    }
    
    var description: String {
        switch self {
        case .x:
            return "x"
        case .o:
            return "o"
        case .e:
            return " "
        }
    }
}
