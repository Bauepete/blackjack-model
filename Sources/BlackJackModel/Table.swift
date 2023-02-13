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
        dealToPlayers()
        dealToDealer()
    }

    fileprivate mutating func dealToPlayers() {
        for (i, _) in players.enumerated() {
            dealCardToPlayer(atBox: i)
            dealCardToPlayer(atBox: i)
        }
    }

    fileprivate mutating func dealCardToPlayer(atBox i: Int) {
        if let dealtCard = dealer.dealOneCard() {
            players[i].receive(card: dealtCard)
        }
    }
    
    fileprivate mutating func dealToDealer() {
        if let dealtCard = dealer.dealOneCard() {
            dealer.receive(card: dealtCard)
        }
    }
}
