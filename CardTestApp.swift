//
//  CardTestApp.swift
//  cardtest
//
//  Created by Ayumu Yamamoto on 2025/04/30.
//

import SwiftUI

@main
struct CardTestApp: App {
    var body: some Scene {
        // iPhone / iPad / Vision Proの2Dウィンドウ
        WindowGroup("Main Window", id: "main", for: String.self) { _ in
            MainMenuView()
        }
        .defaultSize(width: 600, height: 400)

        // Vision Proのボリュメトリックアプリ用
        ImmersiveSpace(id: "immersiveSpace") {
            // Immersive（3D）体験を定義（必要に応じて）
            EmptyView()
        }
    }
}
