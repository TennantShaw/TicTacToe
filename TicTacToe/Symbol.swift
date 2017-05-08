//
//  Symbol.swift
//  TicTacToe
//
//  Created by Tennant Shaw on 4/21/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

enum Symbol : CustomStringConvertible {
    case x
    case o
    
    init?(space: Space) {
        switch space {
        case .e:
            return nil
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
        }
    }
    
}
