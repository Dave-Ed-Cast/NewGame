//
//  GameView.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    /*
     we need to connect the GameScene which is a SKScene to SwiftUI so that we can have a preview. While doing so, we are using the game state, the game logic and a scene wrapper.
     The gamestate must be bound, meaning that it will change according to some modifications that happen elsewhere.
     The StateObject refers to the lifecycle of Observable object
     The State is just to manage the state of the view, therefore position and other characteristics.
     */
    @Binding var currentGameState: GameState
    @StateObject var gameLogic: GameLogic = GameLogic.shared
    @State var sceneWrapper = SceneWrapper()
    
    var body: some View {
        
        let responsiveWidth = UIScreen.main.bounds.width
        let responsiveHeight = UIScreen.main.bounds.height
        
        ZStack {
            SpriteView(scene: sceneWrapper.scene)
            
            ScoreView(gameLogic: GameLogic.shared)
                .position(CGPoint(x: responsiveWidth / 1.75, y: responsiveHeight / 7))
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameView(currentGameState: .constant(GameState.playing))
}
