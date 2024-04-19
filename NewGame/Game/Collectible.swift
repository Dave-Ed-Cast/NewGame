//
//  Collectible.swift
//  NewGame
//
//  Created by Davide Castaldi on 19/04/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func createCollectible() {
        
        let collectible = SKSpriteNode(imageNamed: "expOrb")
        collectible.zPosition = 0
        collectible.size = CGSize(width: 40, height: 40)
        collectible.physicsBody = SKPhysicsBody(rectangleOf: collectible.size)
        collectible.physicsBody?.affectedByGravity = false
        collectible.physicsBody?.categoryBitMask = 2 //unique category bitmask
        collectible.physicsBody?.contactTestBitMask = 1 //set to player's category bitmask
        collectible.position = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.height / 2)
        addChild(collectible)
                
        let fallXAction = SKAction.moveTo(x: -50, duration: 5)
        let fallYAction = SKAction.moveTo(y: -50, duration: 3)
        let sequence = SKAction.sequence([fallXAction, fallYAction])
        collectible.run(sequence)
        
        let removeAction = SKAction.removeFromParent()
        let removeWhenOutOfBounds = SKAction.sequence([SKAction.wait(forDuration: 7), removeAction])
        collectible.run(removeWhenOutOfBounds)
    }
    
    func startCreatingCollectibles() {
        let create = SKAction.run {
            self.createCollectible()
        }
        let wait = SKAction.wait(forDuration: 1) 
        let sequence = SKAction.sequence([create, wait])
        let repeatForever = SKAction.repeatForever(sequence)
        run(repeatForever)
        
        
    }
}
