//
//  GameView.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SwiftUI
import SpriteKit

struct GameViewUI: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        
        var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
        var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
        
        let view = SKView()
        let scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        view.presentScene(scene)
        
        // Enable FPS and physics debugging
        view.showsFPS = true
        view.showsPhysics = true
        
        return view
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
    }
    
    typealias UIViewType = SKView
}

struct GameView: View {
    
    @Binding var currentGameState: GameState
    @StateObject var gameLogic: GameLogic =  GameLogic.shared
    @State var sceneWrapper = SceneWrapper()
    
    var body: some View {
        ZStack {
            SpriteView(scene: self.sceneWrapper.scene)
//                .onChange(of: gameLogic.showPauseMenu, perform: { value in
//                    if(gameLogic.showPauseMenu == false){
//                        sceneWrapper.scene.isPaused = false
//                    }
//                })
        }
    }
}

#Preview {
    GameView()
}
