//
//  Hand.swift
//  
//
//  Created by Peter Bauer on 02.02.23.
//

struct Hand: Collection {
    var startIndex: Int = 0
    var endIndex: Int = 0
    var count: Int {
        return cardsInHand.count
    }
    
    private var cardsInHand: [Card] = []
    
    subscript(position: Int) -> Card {
        return cardsInHand[position]
    }
    
    func index(after i: Int) -> Int {
        return 0
    }
    
    mutating func append(_ newElement: Card) {
        cardsInHand.append(newElement)
    }
}
