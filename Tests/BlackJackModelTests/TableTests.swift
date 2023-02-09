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
}
