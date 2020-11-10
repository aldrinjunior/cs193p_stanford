//
//  EmojiMemoryGameView.swift
//  cs193
//
//  Created by aldrin jr on 30/10/20.
//  Copyright © 2020 aldrin jr. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                    
                }
            }
        }
            .padding(10)
            .foregroundColor(Color.orange)
    }
}
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isfaceUp { // vars cannot be created inside viewbuilders
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
