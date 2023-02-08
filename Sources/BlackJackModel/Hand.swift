//
//  Hand.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

typealias Hand = [Card]

extension Array where Element == Card {
    var value: Int {
        self.reduce(0, { x, y in x + y.value })
    }
}
