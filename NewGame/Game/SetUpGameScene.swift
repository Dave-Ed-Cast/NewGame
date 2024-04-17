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
    
    func createBackground(){
        let background = SKSpriteNode(imageNamed: "background")
        background.zPosition = -1
        background.position = CGPoint(x: 400, y: 100)
        background.setScale(0.5)
        addChild(background)
    }
    
}
