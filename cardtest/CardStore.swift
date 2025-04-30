//
//  CardStore.swift
//  cardtest
//
//  Created by Ayumu Yamamoto on 2025/04/30.
//

import Foundation

class CardStore: ObservableObject {
    static let shared = CardStore()
    @Published var cards: [Card] = []
    private init() {}
}
