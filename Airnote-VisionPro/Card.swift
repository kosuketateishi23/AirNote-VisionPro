//
//  Card.swift
//  cardtest
//
//  Created by Ayumu Yamamoto on 2025/04/30.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let english: String
    let japanese: String
    let partOfSpeech: String
    let memo: String
}
