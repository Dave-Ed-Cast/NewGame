//
//  SetUpGameScene.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import Foundation
import SpriteKit
import GameplayKit
import SwiftUI

extension GameScene {
    
    /*
     this creates the background from layers in the asset folder. The asset folder has the asset named keeping in mind the depth of field of each and every element for implementation purposes
     */
    func createBackground() {
        
        //first we find the asset locations
        let folderURL = "Background/Layers"
        
        //then they are named from 0 to 8 to simplify implementaton
        for i in 0...7 {
            
            //we define each and every element accordingly
            let layer: SKSpriteNode = SKSpriteNode(imageNamed: "\(folderURL)/\(i)")
            
            layer.zPosition = CGFloat(i)
            layer.position = CGPoint(x: responsiveWidth / 2, y: i == 2 ? (responsiveHeight / 2) : responsiveHeight / 1.7)
            layer.setScale(responsiveHeight / responsiveWidth) //this setScale should work for most platforms
            backgroundLayers.append(layer)
            
            let replicatedLayer = backgroundLayers[i].copy() as! SKSpriteNode
            replicatedLayer.position = CGPoint(x: backgroundLayers[i].position.x + backgroundLayers[i].size.width, y: backgroundLayers[i].position.y)
            
            let moveLeftAction = SKAction.moveBy(x: -backgroundLayers[i].size.width, y: 0, duration: 8 * sqrt(Double(i + 1)))
            let resetPositionAction = SKAction.moveBy(x: backgroundLayers[i].size.width, y: 0, duration: 0)
            let sequenceAction = SKAction.sequence([moveLeftAction, resetPositionAction])
            let repeatForeverAction = SKAction.repeatForever(sequenceAction)
            
            addChild(backgroundLayers[i])
            addChild(replicatedLayer)
            
            backgroundLayers[i].run(repeatForeverAction)
            replicatedLayer.run(repeatForeverAction)

        }
    }
}
