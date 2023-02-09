//
//  Table.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

struct Table {
    let dealer: Dealer
    let maxNumberOfPlayers: Int
    private(set) var players: [Player] = []
    
    init(dealer: Dealer, withMaxNumberOfPlayers: Int = 5) {
        self.dealer = dealer
        self.maxNumberOfPlayers = withMaxNumberOfPlayers
    }
    
    mutating func add(player: Player) {
        if players.count < maxNumberOfPlayers {
            players.append(player)
        }
    }
}
