import XCTest
@testable import BlackJackModel

final class DealerTests: XCTestCase {
    
    func testThatItShouldHave312CardsOnStack_GivenConstructedByDefault() throws {
        let d = try XCTUnwrap(Dealer())
        XCTAssertEqual(d.numberOfCardsOnStack, 312)
    }
    
    func testThatItShouldHaveAMultipleOf52OnStack_GivenConstructedWithAValidNumberOfDecks() throws {
        let d = try XCTUnwrap(Dealer(usingDecks: 1))
        XCTAssertEqual(52, d.numberOfCardsOnStack)
    }
    
    func testThatItShouldFail_GivenConstructedWith0Decks() {
        let d = Dealer(usingDecks: 0)
        XCTAssertNil(d)
    }
    
    func testThatItShouldFail_GivenConstructedWith9Decks() {
        let d = Dealer(usingDecks: 9)
        XCTAssertNil(d)
    }
    
    func testThatItShouldShuffle_GivenConstructedCorrectly() throws {
        let d = try XCTUnwrap(Dealer(usingDecks: 1, shufflingWith: { cards in [] }))
        XCTAssertEqual(0, d.numberOfCardsOnStack)
    }
    
    func testThatItShouldHaveOneCardLess_GivenOneCardDealt() throws {
        // arrange
        var d = try XCTUnwrap(Dealer())
        let numberOfCardsOnStack = d.numberOfCardsOnStack
        
        // act
        _ = d.dealOneCard()
        
        // assert
        XCTAssertEqual(d.numberOfCardsOnStack, numberOfCardsOnStack - 1)
    }
    
    func testThatItShouldDealOneCard_GivenEnoughCardsOnStack() throws {
        var d = try XCTUnwrap(Dealer())
        let numberOfCardsAvailable = d.numberOfCardsOnStack
        
        for _ in 0 ..< numberOfCardsAvailable {
            XCTAssertNotNil(d.dealOneCard())
        }
    }
    
    func testThatItShouldDealTheCardFaceUp_GivenTheCardIsDealtToThePlayer() throws {
        var d = Dealer()
        let dealtCard = try XCTUnwrap(d?.dealOneCard())
        XCTAssertTrue(dealtCard.isFaceUp)
    }
}
