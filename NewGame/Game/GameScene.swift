//
//  GameScene.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SpriteKit
import GameplayKit
import SwiftUI

class SceneWrapper{
    var scene = GameScene()
    init() {
        var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
        var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
        scene = GameScene()
        self.scene = GameScene(size: CGSize(width: screenWidth, height: screenHeight))
        self.scene.scaleMode = .fill
    }
}

class GameScene: SKScene {
    
    var isMovingUp: Bool = false
    var player: SKSpriteNode = SKSpriteNode(imageNamed: "player")
    var playerVelocity = CGPoint.self
    
    override func didMove(to view: SKView) {
        // Setup your scene here
        createBackground()
        createPlayer()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        movePlayerUpAndDown()
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMovingUp = true
        print(isMovingUp)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMovingUp = false
        print(isMovingUp)
    }
}
