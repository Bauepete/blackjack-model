import XCTest
@testable import BlackJackModel

final class DealerTests: XCTestCase {
    
    func testThatItShouldHave312CardsOnStack_GivenConstructedByDefault() {
        let d = Dealer()
        XCTAssertEqual(d.numberOfCardsOnStack, 312)
    }
    
    func testThatItShouldHaveOneCardLess_GivenOneCardDealt() {
        var d = Dealer()
        let numberOfCardsOnStack = d.numberOfCardsOnStack
        _ = d.dealOneCard()
        XCTAssertEqual(d.numberOfCardsOnStack, numberOfCardsOnStack - 1)
    }
    
    func testThatItShouldDealOneCard_GivenEnoughCardsOnStack() {
        var d = Dealer()
        let numberOfCardsAvailable = d.numberOfCardsOnStack
        
        for _ in 0 ..< numberOfCardsAvailable {
            XCTAssertNotNil(d.dealOneCard())
        }
    }
    
    func testThatItShouldDealTheCardFaceUp_GivenTheCardIsDealtToThePlayer() throws {
        var d = Dealer()
        let dealtCard = try XCTUnwrap(d.dealOneCard())
        XCTAssertTrue(dealtCard.isFaceUp)
    }
}
