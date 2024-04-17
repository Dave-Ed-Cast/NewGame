//
//  ParentView.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SwiftUI

struct ParentView: View {
    @State var currentGameState: GameState = .mainScreen
    @StateObject var gameLogic: GameLogic = GameLogic.shared
    var body: some View {
        switch currentGameState {
            
        case .playing:
            GameView(currentGameState: $currentGameState)
                .environmentObject(gameLogic)
        
//            GameOverView(currentGameState: $currentGameState, score: $gameLogic.currentScore)
            
        case .mainScreen:
            MainMenu(currentGameState: $currentGameState)
                .environmentObject(gameLogic)
        case .gameOver:
            MainMenu(currentGameState: $currentGameState)
                .environmentObject(gameLogic)
        }
    }
}


#Preview("English"){
    ParentView()
        .environment(\.locale, Locale(identifier: "EN"))
}
