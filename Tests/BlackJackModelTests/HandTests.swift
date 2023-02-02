//
//  HandTests.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

import XCTest
@testable import BlackJackModel

final class HandTests: XCTestCase {
    func testThatItShouldHaveAnElementCountOfZero_GivenConstructed() {
        let hand = Hand()
        XCTAssertEqual(0, hand.count)
    }
}
