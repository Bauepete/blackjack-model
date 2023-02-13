//
//  Table.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

struct Table {
    var dealer: Dealer
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
    
    mutating func startRound() {
        for (i, _) in players.enumerated() {
            if let dealtCard = dealer.dealOneCard() {
                players[i].receive(card: dealtCard)
            }
            if let dealtCard = dealer.dealOneCard() {
                players[i].receive(card: dealtCard)
            }
        }
        if let dealtCard = dealer.dealOneCard() {
            dealer.receive(card: dealtCard)
        }
    }
}
