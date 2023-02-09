//
//  Player.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

enum PlayerDecision { case hit, stand, doubleDown, split, surrender }

func defaultStrategy(using hand: Hand) -> PlayerDecision {
    return hand.value <= 17 ? .hit : .stand
}

struct Player {
    private (set) var hand: Hand = []
    private var strategy: (Hand) -> PlayerDecision
    
    var decision: PlayerDecision {
        return strategy(hand)
    }
    
    init(usingStrategy strategy: @escaping (Hand) -> PlayerDecision = defaultStrategy) {
        self.strategy = strategy
    }
    
    mutating func receive(card: Card) {
        hand.append(card)
    }
}
