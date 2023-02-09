//
//  Hand.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

typealias Hand = [Card]

extension Array where Element == Card {
    var value: Int {
        self.reduce(0, { $0 + ($0 >= 11 && $1.rank == Card.Rank.ace ? 1 : $1.value) })
    }
}
