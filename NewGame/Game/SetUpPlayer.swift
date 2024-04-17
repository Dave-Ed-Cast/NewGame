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
        let player: SKSpriteNode = SKSpriteNode(imageNamed: "player")
        player.position = (CGPoint(x: 400, y: 200))
        player.zPosition = 0
        player.size = CGSize(width: 100, height: 100)
        player.name = "Player"
        addChild(player)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = 1
    }
}
