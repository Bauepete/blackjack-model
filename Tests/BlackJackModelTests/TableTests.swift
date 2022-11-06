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
        var table = Table(dealer: Dealer())
        
            table.add(player: Player())
            
        XCTAssertEqual(1, table.players.count)
    }
    
    func testThatItRefusesToAddPlayers_GivenMoreThan7PlayersAreOnTheTable() {
        var table = Table(dealer: Dealer())
        
        for _ in 1 ... 7 {
             table.add(player: Player())
        }
        table.add(player: Player())
        XCTAssertEqual(7, table.players.count)
    }
}
