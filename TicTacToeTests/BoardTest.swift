//
//  BoardTest.swift
//  TicTacToe
//
//  Created by Tennant Shaw on 4/21/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import XCTest
@testable import TicTacToe

class BoardTests: XCTestCase {
    func testDescriptionOfEmptyBoard() {
        let board = BoardState([:])
        let result = board.description
        
        let expected: String = {
            var string = ""
            string.append("   |   |   ")
            string.append("---+---+---")
            string.append("   |   |   ")
            string.append("---+---+---")
            string.append("   |   |   ")
            
            return string
        }()
        
        XCTAssertEqual(result, expected)
    }

}
