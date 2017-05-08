//
//  AppDelegate.swift
//  TicTacToe
//
//  Created by Tennant Shaw on 4/20/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("What is player x's name?")
        let xName = readLine(strippingNewline: true)
        print("Hello", xName!)
        print("What is player o's name?")
        let oName = readLine(strippingNewline: true)
        print("Hello", oName!)
        print("Okay \(xName!), \(oName!). Lets get this game started.")
        print("Here is our starting board:")
        print("\(gameBoard)")
        print("You play by picking a number to place your marker. The possible choices are 1-9.")
        playStart()
    }

}
