//
//  CardDetailView.swift
//  cardtest
//
//  Created by Ayumu Yamamoto on 2025/04/30.
//

import SwiftUI

struct CardDetailView: View {
    let card: Card
    @State private var flipped = false
    @State private var rotation = 0.0

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                // 表
                CardFrontView(text: card.english)
                    .opacity(flipped ? 0.0 : 1.0)
                    .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))

                // 裏
                CardBackView(card: card)
                    .opacity(flipped ? 1.0 : 0.0)
                    .rotation3DEffect(.degrees(rotation + 180), axis: (x: 0, y: 1, z: 0))
            }
            .frame(width: 320, height: 180)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.6)) {
                    rotation += 180
                    flipped.toggle()
                }
            }

            Spacer()
        }
        .navigationTitle("単語カード")
    }
}

struct CardFrontView: View {
    let text: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 1.0, green: 0.98, blue: 0.9))
            .overlay(
                Text(text)
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.black)
            )
            .shadow(radius: 6)
    }
}

struct CardBackView: View {
    let card: Card

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 1.0, green: 0.98, blue: 0.9))
            .overlay(
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(card.english)
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text(card.partOfSpeech)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    Text(card.japanese)
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)

                    if !card.memo.isEmpty {
                        Text(card.memo)
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .font(.subheadline)
                    }
                }
                .padding()
            )
            .shadow(radius: 6)
    }
}
