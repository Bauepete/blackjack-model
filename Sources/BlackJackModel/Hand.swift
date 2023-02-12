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
        let oneAceMustCountEleven: Bool = valueWithAcesCountingOne < 12 && handContainsAnAce()
        return oneAceMustCountEleven ? valueWithAcesCountingOne + 10 : valueWithAcesCountingOne
    }
    
    fileprivate func handContainsAnAce() -> Bool {
        return self.contains { $0.rank == .ace }
    }
}
