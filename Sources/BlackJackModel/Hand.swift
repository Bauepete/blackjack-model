//
//  Hand.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

typealias Hand = [Card]

extension Array where Element == Card {
    var value: Int {
        let valueOfCardsBeingNoAce = self.reduce(0, { $0 + ($1.rank == Card.Rank.ace ? 0 : $1.value) })
        let acesArray = self.filter({ $0.rank == .ace})
        let thresholdFromWhichAcesToBeCountedAsOne = 11
        return acesArray.reduce(valueOfCardsBeingNoAce,
                                {
                                    $0 + ($0 >= thresholdFromWhichAcesToBeCountedAsOne ? 1 : $1.value)
                                    
                                })
    }
}
