//
//  Player.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

enum PlayerDecision { case hit, stand, doubleDown, split, surrender }

func defaultStrategy() -> PlayerDecision {
    return .stand
}

struct Player {
    private (set) var hand: [Card] = []
    private var strategy: () -> PlayerDecision
    
    var decision: PlayerDecision {
        return strategy()
    }
    
    init(usingStrategy strategy: @escaping () -> PlayerDecision = defaultStrategy) {
        self.strategy = strategy
    }
    
    mutating func receive(card: Card) {
        hand.append(card)
    }
}
