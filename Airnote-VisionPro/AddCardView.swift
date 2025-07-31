//
//  AddCardView.swift
//  cardtest
//
//  Created by Ayumu Yamamoto on 2025/04/30.
//

import SwiftUI

struct AddCardView: View {
    @Environment(\.dismiss) var dismiss
    @State private var english = ""
    @State private var japanese = ""
    @State private var partOfSpeech = "名詞"
    @State private var memo = ""

    let partsOfSpeech = ["名詞", "動詞", "形容詞", "副詞", "その他"]

    var body: some View {
        Form {
            Section(header: Text("英語")) {
                TextField("English", text: $english)
            }

            Section(header: Text("日本語")) {
                TextField("Japanese", text: $japanese)
            }

            Section(header: Text("品詞")) {
                Picker("Part of Speech", selection: $partOfSpeech) {
                    ForEach(partsOfSpeech, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }

            Section(header: Text("メモ")) {
                TextField("Memo", text: $memo)
            }

            Button("保存") {
                let newCard = Card(english: english, japanese: japanese, partOfSpeech: partOfSpeech, memo: memo)
                CardStore.shared.cards.append(newCard)
                dismiss()
            }
        }
        .navigationTitle("新しいカード")
    }
}
