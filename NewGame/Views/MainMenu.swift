//
//  MainMenu.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SwiftUI

struct MainMenu: View {
    
    @StateObject var gameLogic: GameLogic = GameLogic.shared
    @Binding var currentGameState: GameState
    
    var body: some View {
        ZStack {
            
            Image("background")
            MainMenuButton(optionToExecute: {
                withAnimation {
                    self.currentGameState = .playing
                }
            }, buttonImage: "ciao", pressedImage: "ciao", textView: Text("ciao"), textColor: .white, textOffset: 0)
            .responsiveFrame(widthPercentage: 15, heightPercentage: 10)
        }
        
    }
}

#Preview {
    MainMenu(currentGameState: .constant(GameState.mainScreen))
}
