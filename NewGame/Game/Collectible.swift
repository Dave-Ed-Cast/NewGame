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
        
        let responsiveWidth = UIScreen.main.bounds.size.width
        let responsiveHeight = UIScreen.main.bounds.size.height * 1.5
        let randomWidth = CGFloat.random(in: (responsiveWidth / 3)...responsiveWidth)
        
        let collectible = SKSpriteNode(imageNamed: "expOrb")
        collectible.zPosition = 0
        collectible.size = CGSize(width: 40, height: 40)
        collectible.physicsBody = SKPhysicsBody(rectangleOf: collectible.size)
        collectible.physicsBody?.affectedByGravity = false
        collectible.physicsBody?.categoryBitMask = 2 //this is for contact collisions, must be unique
        collectible.physicsBody?.contactTestBitMask = 1 //set to player's category bitmask
        collectible.position = CGPoint(x: randomWidth, y: responsiveHeight)
        addChild(collectible)
        
        
        let randomX = CGFloat.random(in: 0...(UIScreen.main.bounds.size.width - collectible.size.width))
        let randomY = CGFloat.random(in: 0...(UIScreen.main.bounds.size.height - collectible.size.height))
        
        let randomDurationX = Double.random(in: 4...8)
        let randomDurationY = Double.random(in: 4...8)
        
        let fallXAction = SKAction.moveTo(x: -(UIScreen.main.bounds.size.width / randomX), duration: randomDurationX)
        let fallYAction = SKAction.moveTo(y: -randomY, duration: randomDurationY)
        let sequence = SKAction.group([fallXAction, fallYAction])
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
