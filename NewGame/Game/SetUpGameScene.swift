//
//  SetUpGameScene.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    func createBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.zPosition = -1
        background.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        background.setScale(0.6)
        addChild(background)
        
        let replicatedBackground = background.copy() as! SKSpriteNode
        replicatedBackground.position = CGPoint(x: background.position.x + background.size.width, y: background.position.y)
        addChild(replicatedBackground)
        
        // Create a scrolling action
        let moveLeftAction = SKAction.moveBy(x: -background.size.width, y: 0, duration: 8)
        let resetPositionAction = SKAction.moveBy(x: background.size.width, y: 0, duration: 0)
        let sequenceAction = SKAction.sequence([moveLeftAction, resetPositionAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        
        // Apply scrolling action to both background sprites
        background.run(repeatForeverAction)
        replicatedBackground.run(repeatForeverAction)
    }
    
}
