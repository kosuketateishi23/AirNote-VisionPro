//
//  MainMenuView.swift
//  cardtest
//
//  Created by Ayumu Yamamoto on 2025/04/30.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("カード一覧", destination: CardListView())
                NavigationLink("新しいカードを追加", destination: AddCardView())
            }
            .navigationTitle("メニュー")
        }
    }
}
