//
//  MemoryGame.swift
//  cs193
//
//  Created by aldrin jr on 31/10/20.
//  Copyright © 2020 aldrin jr. All rights reserved.
//
//  Model

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card choose: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isfaceUp = !self.cards[chosenIndex].isfaceUp
    }
    // Just geting index of array
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
    
    init(numberOfPairsCard: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsCard {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isfaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
