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
    var player: SKSpriteNode = SKSpriteNode(imageNamed: "player")
    var playerVelocity = CGPoint(x: 0, y: 1)
    let maxVelocity: CGFloat = 10.0
    var backgroundLayers: [SKSpriteNode] = []
    
    
    override func didMove(to view: SKView) {
        // Setup your scene here
        physicsWorld.contactDelegate = self
        

        createBackground()
        createPlayer()
        startCreatingCollectibles()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        movePlayerUpAndDown()
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == 1 || contact.bodyB.categoryBitMask == 1 {
            // Increment score or handle collectible collection
            if let collectibleNode = (contact.bodyA.categoryBitMask == 2) ? contact.bodyA.node : contact.bodyB.node {
                collectibleNode.removeFromParent()
            }
            gameLogic.currentScore += 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMovingUp = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMovingUp = false
    }
}
