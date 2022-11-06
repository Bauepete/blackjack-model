//
//  Player.swift
//  
//
//  Created by Peter Bauer on 06.11.22.
//

struct Player {
    private(set) var hand: [Card] = []
    
    mutating func receive(card: Card) {
        hand.append(card)
    }
}
