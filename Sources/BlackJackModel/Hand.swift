//
//  Hand.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

typealias Hand = [Card]

extension Array where Element == Card {
    var value: Int {
        let valueWithAcesCountingOne = self.reduce(0, { $0 + ($1.rank == Card.Rank.ace ? 1 : $1.value) })
        if valueWithAcesCountingOne < 12 && handContainsAnAce()  {
            return valueWithAcesCountingOne + 10
        } else {
            return valueWithAcesCountingOne
        }
    }
    
    fileprivate func handContainsAnAce() -> Bool {
        return self.contains(where: { $0.rank == .ace })
    }
}
