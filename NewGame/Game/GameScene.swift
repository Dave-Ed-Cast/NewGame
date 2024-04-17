//
//  GameScene.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SpriteKit
import GameplayKit
import SwiftUI

class SceneWrapper{
    var scene = GameScene()
    init() {
        var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
        var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
        scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
    }
}

class GameScene {
    
}
