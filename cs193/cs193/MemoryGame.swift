//
//  MemoryGame.swift
//  cs193
//
//  Created by aldrin jr on 31/10/20.
//  Copyright © 2020 aldrin jr. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card choose: \(card)")
    }
    
    struct Card {
        var isfaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
