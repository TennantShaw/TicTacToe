//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Tennant Shaw on 4/20/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    
    func testCreatePlayerWithNonemptyName() {
        let result = createPlayer(name: "Tennant", symbol: .x)
        let expected = Player(name: "Tennant", symbol: .x)
        XCTAssertEqual(result, expected)
    }
    
    func testCreatePlayerWithEmptyName() {
        let result = createPlayer(name: "", symbol: .x)
        let expected: Player? = nil
        XCTAssertEqual(result, expected)
    }
}


