//
//  ContentView.swift
//  Memorize
//
//  Created by Ton Smink on 18/02/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻","👹","👺","☠️","🤖","👽","💀"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            addButton
            Spacer()
            removeButton
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount , id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.orange)
    }
    
    var addButton: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label:{
            Image(systemName: "bag.badge.plus.fill")
        })
    }
    
    var removeButton: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label:{
            Image(systemName: "bag.badge.minus.fill")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(content:  {
            let base = RoundedRectangle(cornerRadius: 12)
            if (isFaceUp){
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }).onTapGesture {
            print("tapped")
            //isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
