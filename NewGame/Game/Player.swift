//
//  SetUpPlayer.swift
//  NewGame
//
//  Created by Davide Castaldi on 17/04/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func createPlayer() {
        
        player.position = CGPoint(x: UIScreen.main.bounds.size.width / 4 , y: UIScreen.main.bounds.height / 3)
        player.zPosition = 0
        player.size = CGSize(width: 100, height: 100)
        player.name = "Player"
        addChild(player)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.categoryBitMask = 1
        
    }
    
    func movePlayerUpAndDown() {
        
        player.position.y += isMovingUp ? 5 : -5
        
        let minY = player.size.height / 1.5
        let maxY = size.height - player.size.height / 1.5
        
           
        player.position.y = max(min(player.position.y, maxY), minY)
    }
}
