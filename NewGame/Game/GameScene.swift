//
//  GameScene.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SpriteKit
import GameplayKit
import SwiftUI

class SceneWrapper {
    var scene = GameScene()
    init() {
        var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
        var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
        scene = GameScene()
        self.scene = GameScene(size: CGSize(width: screenWidth, height: screenHeight))
        self.scene.scaleMode = .fill
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //get the screen size
    let responsiveWidth = UIScreen.main.bounds.size.width
    let responsiveHeight = UIScreen.main.bounds.size.height
    
    var gameLogic: GameLogic = GameLogic.shared
    var isMovingUp: Bool = false
    var touchingScreen: Bool = false
    var player: SKSpriteNode = SKSpriteNode(imageNamed: "player")
    var backgroundLayers: [SKSpriteNode] = []
    var impulseMagnitude: CGFloat = 0 // Initialize impulse magnitude
    let maxImpulse: CGFloat = 1.1 // Maximum impulse magnitude when touching screen
    
    override func didMove(to view: SKView) {
        // Setup your scene here
        physicsWorld.contactDelegate = self
        
        createBackground()
        createPlayer()
        startCreatingCollectibles()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        playerMovement()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == 1 || contact.bodyB.categoryBitMask == 1 {
            //whenever the player and the collectible touch, the collectible disappears and score increments
            if let collectibleNode = (contact.bodyA.categoryBitMask == 2) ? contact.bodyA.node : contact.bodyB.node {
                collectibleNode.removeFromParent()
            }
            gameLogic.currentScore += 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchingScreen = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchingScreen = false
    }
}
