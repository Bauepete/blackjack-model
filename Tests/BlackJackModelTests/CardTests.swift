//
//  CardTests.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

import XCTest
@testable import BlackJackModel

final class CardTests: XCTestCase {
    func testItShouldShowItsRankAndSuit_GivenConstructedProperly() {
        let card = Card(rank: Card.Rank.two, suit: Card.Suit.spades)
        XCTAssertEqual(card.rank, Card.Rank.two)
    }
    
    func testThatItShouldReturn2AsValue_GivenTheCardHasRankTwo() {
        let anySuit = Card.Suit.spades
        let card = Card(rank: Card.Rank.two, suit: anySuit)
        let value = card.value
        XCTAssertEqual(value, 2)
    }
    
    func testThatItShouldReturn3AsValue_GivenTheCardHasRankThree() {
        let anySuit = Card.Suit.diamonds
        let card = Card(rank: Card.Rank.three, suit: anySuit)
        XCTAssertEqual(3, card.value)
    }
    
    func testThatItShouldReturnTheCorrectCardValue_GivenAnyCardIsGiven() {
        let anySuit = Card.Suit.hearts
        var cardsUnderTest: [Int] = []
        let expectedValues = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
        for rank in Card.Rank.allCases {
            cardsUnderTest.append(Card(rank: rank, suit: anySuit).value)
        }
        XCTAssertEqual(expectedValues, cardsUnderTest)
    }
    
    func testThatTwoCardsAreEqual_GivenTheyHaveEqualValues() {
        let anySuit = Card.Suit.spades
        let anyRank = Card.Rank.eight
        
        let c1 = Card(rank: anyRank, suit: anySuit)
        let c2 = Card(rank: anyRank, suit: anySuit)
        
        XCTAssertEqual(c1, c2)
    }
    
    func testThatTwoCardsAreUnequal_GivenTheyHaveDifferentValues() {
        let c1 = Card(rank: Card.Rank.eight, suit: Card.Suit.clubs)
        let c2 = Card(rank: Card.Rank.nine, suit: Card.Suit.clubs)
        
        XCTAssertNotEqual(c1, c2)
    }
}
