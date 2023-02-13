//
//  Table.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//
import XCTest
@testable import BlackJackModel

final class TableTests: XCTestCase {
    func testThatPlayerIsInPlayerList_GivenItIsAddedToTable() {
        var table = Table(dealer: Dealer()!)
        
        table.add(player: Player())
        
        XCTAssertEqual(1, table.players.count)
    }
    
    func testThatItRefusesToAddPlayers_GivenMaxNumberOfPlayersAreOnTheTable() {
        let maxNumberOfPlayers = 8
        var table = Table(dealer: Dealer()!, withMaxNumberOfPlayers: maxNumberOfPlayers)
        
        for _ in 1 ... maxNumberOfPlayers {
            table.add(player: Player())
        }
        table.add(player: Player())
        XCTAssertEqual(maxNumberOfPlayers, table.players.count)
    }
    
    func testThatItShouldAskTheDealerToDealEachPlayerTwoCardsAndTheDealerOneCard_GivenStartRoundIsCalled() throws {
        var table = Table(dealer: try XCTUnwrap(Dealer()))
        for _ in 1 ... 2 { table.add(player: Player()) }
        let cardsOnDealerStack = table.dealer.numberOfCardsOnStack
        
        table.startRound()
        
        table.players.forEach({ XCTAssertEqual(2, $0.hand.count) })
        XCTAssertEqual(1, table.dealer.hand.count)
        XCTAssertEqual(cardsOnDealerStack - 5, table.dealer.numberOfCardsOnStack)
    }
}
