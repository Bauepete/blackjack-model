//
//  HandTests.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

import XCTest
@testable import BlackJackModel

final class HandTests: XCTestCase {
    private var hand: Hand!
    
    override func setUp() {
        hand = Hand()
    }
    
    func testThatItShouldHaveAnElementCountOfZero_GivenConstructed() {
        let hand = Hand()
        XCTAssertEqual(0, hand.count)
    }
    
    func testThatItShouldHaveAnElementCountOfOne_GivenOneCardAdded() {
        var hand = Hand()
        
        hand.append(Card(rank: .ace, suit: .clubs))
        
        XCTAssertEqual(1, hand.count)
    }
    
    func testThatItShouldHaveASpecificCard_GivenTheCardWasAdded() {
        var hand = Hand()
        let someCard = Card(rank: .ace, suit: .clubs)
        
        hand.append(someCard)
        let firstCard = hand[0]
        
        XCTAssertEqual(someCard, firstCard)
    }
    
    func testThatItShouldHaveTwoCards_GivenTwoCardsAdded() {
        let firstCard = Card(rank: .two, suit: .clubs)
        let secondCard = Card(rank: .ace, suit: .spades)
        
        hand.append(firstCard)
        hand.append(secondCard)
        
        let firstCardFromHand = hand[0]
        let secondCardFromHand = hand[1]
        
        XCTAssertEqual(firstCard, firstCardFromHand)
    }
}
