//
//  Hand.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

typealias Hand = [Card]

extension Array where Element == Card {
    var value: Int {
        let normalCardsValue = self.reduce(0, { $0 + ($1.rank == Card.Rank.ace ? 0 : $1.value) })
        let acesCount = self.reduce(0, { $0 + ($1.rank == Card.Rank.ace ? 1 : 0) })
        let acesArray = Array(repeating: Card(rank: .ace, suit: .clubs), count: acesCount)
        return acesArray.reduce(normalCardsValue, { $0 + ($0 >= 11 ? 1 : $1.value) })
    }
}
