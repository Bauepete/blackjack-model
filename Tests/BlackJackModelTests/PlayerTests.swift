//
//  File.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

import XCTest
@testable import BlackJackModel

final class PlayerTests: XCTestCase {
    func testThatItShouldHaveAnEmptyHand_GivenConstructed() {
        let player = Player()
        XCTAssertEqual([], player.hand)
    }
    
    func testThatItShouldHoldOneCard_GivenOneCardIsDealt() {
        var player = Player()
        
        let dealtCard: Card = Card(rank: Card.Rank.ace, suit: Card.Suit.clubs)
        player.receive(card: dealtCard)
        XCTAssertEqual(player.hand, [dealtCard])
    }
}
