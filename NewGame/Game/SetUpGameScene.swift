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
    
    func createBackground() {
        let folderURL = "Background/Layers"
        for i in 0...8 {
            
            let layer: SKSpriteNode = SKSpriteNode(imageNamed: "\(folderURL)/\(i)")
            let layerPosition = backgroundLayers[i].position
            let layerSizeWidth = backgroundLayers[i].size.width
            
            layer.zPosition = -1
            layer.position = CGPoint(x: responsiveWidth / 2, y: responsiveHeight / 2)
            layer.setScale(responsiveHeight / responsiveWidth) //this setScale should work for most platforms
            backgroundLayers.append(layer)
            
            let replicatedLayer = backgroundLayers[i].copy() as! SKSpriteNode
            replicatedLayer.position = CGPoint(x: layerPosition.x + layerSizeWidth, y: layerPosition.y)
            
            let moveLeftAction = SKAction.moveBy(x: -layerSizeWidth, y: 0, duration: Double(i) * sqrt(0.5))
            let resetPositionAction = SKAction.moveBy(x: layerSizeWidth, y: 0, duration: 0)
            let sequenceAction = SKAction.sequence([moveLeftAction, resetPositionAction])
            let repeatForeverAction = SKAction.repeatForever(sequenceAction)
            
            addChild(backgroundLayers[i])
            addChild(replicatedLayer)
            
            backgroundLayers[i].run(repeatForeverAction)
            replicatedLayer.run(repeatForeverAction)

        }
        
        
        //        let replicatedLayer0 = backgroundLayers[0].copy() as! SKSpriteNode
        //        replicatedLayer0.position = CGPoint(x: backgroundLayers[0].position.x + backgroundLayers[0].size.width, y: backgroundLayers[0].position.y)
        //        addChild(replicatedLayer0)
        //
        //
        //
        //
        //        replicatedLayer0.run(repeatForeverAction)
    }
}






//this is going into the didMove so that it gets called just once and repeat forever
//    func createBackground() {
//
//            let folderURL = "Background/Layers"
//
//        //load the layers for the background. The assets are ordered by the "farthest" from the user perspective
//        for i in 0...8 {
//            let layer: SKSpriteNode = SKSpriteNode(imageNamed: "\(folderURL)/\(i)")
//            layer.zPosition = -1
//            layer.position = CGPoint(x: responsiveWidth / 2, y: responsiveHeight / 2)
//            //            layer.setScale(0.45)
//            //this setScale should work for most platforms
//            layer.setScale(responsiveHeight / responsiveWidth)
//            backgroundLayers.append(layer)
//            addChild(backgroundLayers[i])
//        }
//
//        for i in 0...8 {
//            replicatedLayers[i] = backgroundLayers[i].copy() as! SKSpriteNode
//            replicatedLayers[i].position = CGPoint(x: backgroundLayers[i].position.x + backgroundLayers[i].size.width, y: backgroundLayers[i].position.y)
//            addChild(replicatedLayers[i])
//            let moveLeft = SKAction.moveBy(x: -backgroundLayers[i].size.width, y: 0, duration: 8)
//            let resetPosition = SKAction.moveBy(x: backgroundLayers[i].size.width, y: 0, duration: 0)
//            let sequence = SKAction.sequence([moveLeft, resetPosition])
//            let endlessAction = SKAction.repeatForever(sequence)
//
//            replicatedLayers[i].run(endlessAction)
//        }
//        //now to achieve the independet movement of every element, we have to replicate each layer
////        let replicatedLayer0 = backgroundLayers[0].copy() as! SKSpriteNode
////        replicatedLayer0.position = CGPoint(x: backgroundLayers[0].position.x + backgroundLayers[0].size.width, y: backgroundLayers[0].position.y)
////        addChild(replicatedLayer0)
//
//
//
//        //        //replicate the background so that it is moving
//        //        let replicatedBackground = background.copy() as! SKSpriteNode
//        //        replicatedBackground.position = CGPoint(x: background.position.x + background.size.width, y: background.position.y)
//        //        addChild(replicatedBackground)
//        //
//        //TODO: define dynamic background layers
//
//
//        //        //define the scrolling action for movement of the background and the action that will be repeated
//        //        let moveLeftAction = SKAction.moveBy(x: -background.size.width, y: 0, duration: 8)
//        //        let resetPositionAction = SKAction.moveBy(x: background.size.width, y: 0, duration: 0)
//        //        let sequenceAction = SKAction.sequence([moveLeftAction, resetPositionAction])
//        //        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
//        //
//        //        let newRandomNumber = SKAction.wait(forDuration: 1.5)
//        //
//        //        //run the actions
//        //        background.run(repeatForeverAction)
//        //        replicatedBackground.run(repeatForeverAction)
//        //        .run(newRandomNumber)
//
//
//
//
//
//
//    }

