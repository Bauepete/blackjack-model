//
//  Card.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

struct Card {
    let isFaceUp = true
    let rank: Rank
    let suit: Suit
    
    var value: Int {
        get {
            var value = min(rank.rawValue, 10)
            if rank == .ace {
                value = 11
            }
            return value
        }
    }
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }

    enum Rank: Int, CaseIterable {
        case two = 2
        case three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
    }

    enum Suit: CaseIterable {
        case spades, hearts, diamonds, clubs
    }
}

