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
        player.physicsBody?.collisionBitMask = 0 //set to 0 because whenever it collides, it doesn't change the position caused by the collision
        addChild(player)
    }
    
    //this function is the controls of the player
    func playerMovement() {
        //the player flyes upward if he touches the screen
        let impulseMagnitude: CGFloat = touchingScreen ? 30 : -2
        let impulse = CGVector(dx: 0, dy: impulseMagnitude)
        player.physicsBody?.applyImpulse(impulse)

        let maxVelocity: CGFloat = 220
        player.physicsBody?.velocity = CGVector(dx: 0, dy: min(max(player.physicsBody!.velocity.dy, -maxVelocity), maxVelocity))
        
        //the player stays in the bounds of the screen
        let minY: CGFloat = player.size.height / 1.5
        let maxY: CGFloat = size.height - player.size.height / 1.5
        player.position.y = max(min(player.position.y, maxY), minY)
    }
    
}
