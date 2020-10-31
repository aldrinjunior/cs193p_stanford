//
//  EmojiMemoryGame.swift
//  cs193
//
//  Created by aldrin jr on 31/10/20.
//  Copyright © 2020 aldrin jr. All rights reserved.
//
// The View Model is basicly a UI

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsCard: emojis.count) { pairIndex in
                return emojis[pairIndex]
        }
    }

    
    // MARK: - Acess to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

