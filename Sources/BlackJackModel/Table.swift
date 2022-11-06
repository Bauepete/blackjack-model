//
//  Table.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

struct Table {
    let dealer: Dealer
    private(set) var players: [Player] = []
    
    init(dealer: Dealer) {
        self.dealer = dealer
    }
    
    mutating func add(player: Player) {
        if players.count < 7 {
            players.append(player)
        }
    }
}
