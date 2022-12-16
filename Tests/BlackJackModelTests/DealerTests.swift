import XCTest
@testable import BlackJackModel

final class DealerTests: XCTestCase {
    
    func testThatItShouldHave312CardsOnStack_GivenConstructedByDefault() {
        let d = Dealer()
        XCTAssertEqual(d?.numberOfCardsOnStack, 312)
    }
    
    func testThatItShouldHaveAMultipleOf52OnStack_GivenConstructedWithAValidNumberOfDecks() {
        let d = Dealer(usingDecks: 1)
        XCTAssertEqual(52, d?.numberOfCardsOnStack)
    }
    
    func testThatItShouldFail_GivenConstructedWith0Decks() {
        let d = Dealer(usingDecks: 0)
        XCTAssertNil(d)
    }
    
    func testThatItShouldFail_GivenConstructedWith9Decks() {
        let d = Dealer(usingDecks: 9)
        XCTAssertNil(d)
    }
    
    func testThatItShouldShuffle_GivenConstructedCorrectly() {
        let d = Dealer(usingDecks: 1, shufflingWith: { cards in [] })
        XCTAssertEqual(0, d!.numberOfCardsOnStack)
    }
    
    func testThatItShouldHaveOneCardLess_GivenOneCardDealt() {
        var d = Dealer()
        guard let numberOfCardsOnStack = d?.numberOfCardsOnStack else {
            XCTFail()
            return
        }
        _ = d?.dealOneCard()
        XCTAssertEqual(d?.numberOfCardsOnStack, numberOfCardsOnStack - 1)
    }
    
    func testThatItShouldDealOneCard_GivenEnoughCardsOnStack() {
        var d = Dealer()
        guard let numberOfCardsAvailable = d?.numberOfCardsOnStack else {
            XCTFail()
            return
        }
        
        for _ in 0 ..< numberOfCardsAvailable {
            XCTAssertNotNil(d?.dealOneCard())
        }
    }
    
    func testThatItShouldDealTheCardFaceUp_GivenTheCardIsDealtToThePlayer() throws {
        var d = Dealer()
        let dealtCard = try XCTUnwrap(d?.dealOneCard())
        XCTAssertTrue(dealtCard.isFaceUp)
    }
}
