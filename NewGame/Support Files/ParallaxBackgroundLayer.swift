//
//  ParallaxBackgroundLayer.swift
//  BirdGame
//
//  Created by Davide Castaldi on 23/04/24.
//

import Foundation
import SpriteKit

class ParallaxBackgroundLayer: SKSpriteNode {
    
    var speedFactor: CGFloat = 1.0
    let screenWidth = UIScreen.main.bounds.width
    
    func startScrolling() {
        let moveAction = SKAction.moveBy(x: -screenWidth, y: 0, duration: 8)
        let resetAction = SKAction.moveBy(x: screenWidth, y: 0, duration: 0)
        let sequence = SKAction.sequence([moveAction, resetAction])
        let repeatForever = SKAction.repeatForever(sequence)
        
        // Adjust the speed of the action directly
        repeatForever.speed = speedFactor
        
        self.run(repeatForever)
    }
}

