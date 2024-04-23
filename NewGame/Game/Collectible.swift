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
        
        //define random width according to screen size for gameplay purposes
        let randomWidth = CGFloat.random(in: (responsiveWidth / 3)...responsiveWidth)
        
        //create tbe collectible
        let collectible = SKSpriteNode(imageNamed: "pickup")
        collectible.zPosition = 11
        collectible.size = CGSize(width: 35, height: 60)
        collectible.physicsBody = SKPhysicsBody(rectangleOf: collectible.size)
        collectible.physicsBody?.affectedByGravity = false
        collectible.physicsBody?.categoryBitMask = 2 //this is for contact collisions, must be unique
        collectible.physicsBody?.contactTestBitMask = 1 //must equal player's category bitmask
        collectible.position = CGPoint(x: randomWidth, y: responsiveHeight)
        addChild(collectible)
        
        //define random factors to adjust gmaeplay difficulty
        let randomX = CGFloat.random(in: responsiveWidth / 3...responsiveWidth - collectible.size.width / 2)
        let randomY = CGFloat.random(in: 0...responsiveHeight - (collectible.size.height / 2))
        
        //define duration for the same purpose as above
        let randomDurationX = Double.random(in: 4...8)
        let randomDurationY = Double.random(in: 4...8)
        
        //simulate the falling
        let fallXAction = SKAction.moveTo(x: -randomX, duration: randomDurationX)
        let fallYAction = SKAction.moveTo(y: -randomY, duration: randomDurationY)
        let sequence = SKAction.group([fallXAction, fallYAction])
        collectible.run(sequence)
        
        //remove the child if it's not collected
        let removeAction = SKAction.removeFromParent()
        let removeWhenOutOfBounds = SKAction.sequence([SKAction.wait(forDuration: 8), removeAction])
        collectible.run(removeWhenOutOfBounds)
    }
    
    func startCreatingCollectibles() {
        let create = SKAction.run {
            self.createCollectible()
        }
        let wait = SKAction.wait(forDuration: 2)
        let sequence = SKAction.sequence([create, wait])
        let repeatForever = SKAction.repeatForever(sequence)
        run(repeatForever)
        
        
    }
}
