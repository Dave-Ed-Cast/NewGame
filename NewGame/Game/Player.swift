//
//  SetUpPlayer.swift
//  NewGame
//
//  Created by Davide Castaldi on 17/04/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    //create the player with its configurations
    func createPlayer() {
        
        /*
         for uses of game scene, the variable player is create outside and is the SKSpriteNode
         .position is for the spatial position
         .zPosition is for the level from the Z axis. For example, if the zPosition of the background is higher than the zPosition of the player, the player would be below, or visually speaking behind, the ground
         .size is obvious
         .name is to define a name of the sprite
         .phyisicsBody is to introduce the concept of the body which will respond to collisions. The size of this body can be of different types, usually it's preferred to have rectangles
         .physicsBody?.affectedByGravity is obvious
         .physicsBody?.categoryBitMask is used for the contact collision and must be unique to the sprite type, so that the logic of the game can work (see more in "didBegin")
         .physicsBody?.contactTestBitMask is used to define with which object can the sprite collide with. In fact, this must be equal to the collectible and other object such as obstacles if we want things to happen
         
         at the end (some people do it earlier but this is my way of writing code) we add the child.
         
         */
        player.position = CGPoint(x: UIScreen.main.bounds.size.width / 4 , y: UIScreen.main.bounds.height / 2)
        player.zPosition = 10
        player.size = CGSize(width: 100, height: 100)
        player.name = "Player"
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width / 2, height: player.size.height / 2))
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.categoryBitMask = 1
        player.physicsBody?.contactTestBitMask = 1
        addChild(player)
    }
    
    //this function is the controls of the player
    func movePlayerUpAndDown() {
        
        /*
         first things first, the velocity must be defined. Considering this game to be a horizontal game (landscape as the technician term would suggest) we have to consider the y coordinate.
         Then we are going to moove the player and the velocity must be set.
         The velocity direction is changed by tapping and holding the screen, by default the player will fall
         Then we have a max size and min size that serve as edges for the screen.
         It is important to note that the concept of drag has been added, for the reason of having some sort of reality in the movement
         */
        let dragFactor: CGFloat = 0.7
        playerVelocity.y *= (1 - dragFactor)
        playerVelocity.y = max(-maxVelocity, min(playerVelocity.y, maxVelocity))
        
        player.position.y += playerVelocity.y
        player.position.y += isMovingUp ? 5 : -5
        
        let minY = player.size.height / 1.5
        let maxY = size.height - player.size.height / 1.5
        
        player.position.y = max(min(player.position.y, maxY), minY)
        
        // the player is not moving up and moving downwards => reduce the velocity, else increase
        playerVelocity.y += (!isMovingUp && playerVelocity.y < 0) ? 1.5 : -1.5
        
        
    }
}
