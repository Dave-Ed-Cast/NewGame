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
            
            //then we define the zPosition in a linear way so that everything stacks
            layer.zPosition = CGFloat(i)
            /*
             According to the resolution of the image asset, they needed to be of the right dimension to work. To do so, we are going to use a responsive way that adapts to the user screen so that every screen can display the correct sizes as they are meant to be
             */
            layer.position = CGPoint(x: responsiveWidth / 2, y: responsiveHeight / 2)
            layer.setScale(responsiveHeight / responsiveWidth) //this setScale should work for most platforms
            
            /*
             Following the last comment, it is imperative to also modify the layers position independently. Therefore, we are going to use a switch case that helps to filter the particular assets
             */
            switch i {
                
            case 4:
                modifyLayerPosition(layer: layer, index: i, newX: layer.position.x, newY: responsiveHeight / 2.45)
            case 7:
                modifyLayerPosition(layer: layer, index: i, newX: layer.position.x, newY: responsiveHeight / 1.6)
            default:
                layer.position = CGPoint(x: responsiveWidth / 2, y: responsiveHeight / 2)
            }
            
            //then we finally append into the array
            backgroundLayers.append(layer)
            
            /*
             to give the impression of a moving player, everything else must move. This means that everything has to be copied at least once so that we can create the parallax. To do so, we are going to copy the current layer and define its position to spawn just after the next. Note that every layer has the same default resolution as the full image, simplifying some things
             */
            let replicatedLayer = backgroundLayers[i].copy() as! SKSpriteNode
            replicatedLayer.position = CGPoint(x: backgroundLayers[i].position.x + backgroundLayers[i].size.width, y: backgroundLayers[i].position.y)
            
            /*
             now given that everything stacks upon themselves, using a duration multiplier is very handy because otherwise we would need to define each and every duration for every layer. This is the big part of the logic that makes it very automatized
             */
            let durationMultiplier = Double(9 - i)
            
            /*
             this is the core part that defines the movement and its duration. For preview purposes, we cannot really use the layer we created because at runtime of the preview, it is not fast enough to load the information, throwing a preview crash error, therefore we have to use this ugly version of it
             */
            let moveLeftAction = SKAction.moveBy(x: -backgroundLayers[i].size.width, y: 0, duration: durationMultiplier * Double(i + 1))
            
            //we reset the position so that we can give the illusion of endless repeatition
            let resetPositionAction = SKAction.moveBy(x: backgroundLayers[i].size.width, y: 0, duration: 0)
            
            //then we define the sequence and run it
            let sequenceAction = SKAction.sequence([moveLeftAction, resetPositionAction])
            let repeatForeverAction = SKAction.repeatForever(sequenceAction)
            
            //lastly, i add everything to the scene and run the animations
            addChild(backgroundLayers[i])
            addChild(replicatedLayer)
            
            backgroundLayers[i].run(repeatForeverAction)
            replicatedLayer.run(repeatForeverAction)
            
        }
    }
    
    //this is a simp function that has in input a layer and mofies its values according to the index
    func modifyLayerPosition(layer: SKSpriteNode, index: Int, newX: Double, newY: Double) {
        
        layer.position = CGPoint(x: newX, y: newY)
    }
}
