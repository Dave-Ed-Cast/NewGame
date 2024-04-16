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
    
    func createBestScoreLabel(){
        bestScoreLabel.text = "HIGHEST: \(bestScore)"
        bestScoreLabel.zPosition = 5
        bestScoreLabel.fontColor = .black
        //bestScoreLabel.fontColor = UIColor(named: "ThatYellow")
        updateBestScoreLabel()
        addChild(bestScoreLabel)
    }
    
    func createScore(){
        //checkFonts()
        scoreLabel.zPosition = 3
        scoreLabel.fontColor = .black
        updateScoreLabelPosition()
        score = 0
        addChild(scoreLabel)
        
    }
        
    func createBG(){
        let background = SKSpriteNode(imageNamed: "background")
        background.zPosition = -10
        background.position.y = 70
        addChild(background)
    }
    
    func createPlayer() {
        player.position.x = -265
        //player.position.y = -200
        player.zPosition = 1
        player.name = "Player"
        addChild(player)
        let playerBody = CGSize(width: player.size.width - 30, height: player.size.height - 20)
        player.physicsBody = SKPhysicsBody(rectangleOf: playerBody)
        player.physicsBody?.categoryBitMask = 1
    }
    
    func createSnow() {
        if let particles = SKEmitterNode(fileNamed: "SnowParticle"){
            particles.advanceSimulationTime(2)
            particles.position.x = 0
            particles.position.y = 200
            addChild(particles)
        }
    }
    
    func updateExitButtonPosition(){
        exitButton.position = CGPoint(x: (camera?.position.x)! - 330, y: (camera?.position.y)! + 130)
    }
    
    func createExitButton(){
        exitButton = SKSpriteNode(imageNamed: "exit")
        exitButton.zPosition = 100
        updateExitButtonPosition()
        addChild(exitButton)
    }
    
    func createMusicButton(){
        if(musicActive){
            musicButton = SKSpriteNode(imageNamed: "volumeon")
        } else {
            musicButton = SKSpriteNode(imageNamed: "volumeoff")
        }
        musicButton.zPosition = 100
        updateMusicButtonPosition()
        addChild(musicButton)
    }
    
    func createMenu(){
        if !gameLogic.isGameOver {
            //restart menu
        } else {
            //first time menu
            playButton = SKSpriteNode(imageNamed: "play")
            playButton.zPosition = 70
            playButton.position = CGPoint(x: frame.midX - 250, y: frame.midY - 180)
            self.addChild(playButton)
        }
        
    }
    
    func createMusic(){
        let music = SKAudioNode(fileNamed: "wind.mp3")
        music.name = "Music"
        addChild(music)
    }
    
    @objc func createGround() {
        for i in 0 ... 3 {
            let ground = SKSpriteNode(imageNamed: "ground")
            ground.name = "Ground"
            let rectWidth = ground.size.width
            let rectHeight = ground.size.height - 65
            let rectangle = CGSize(width: rectWidth, height: rectHeight)
            ground.physicsBody = SKPhysicsBody(rectangleOf: rectangle)
            ground.physicsBody!.isDynamic = false
            ground.physicsBody!.affectedByGravity = false
            ground.physicsBody!.categoryBitMask = 2
            ground.zPosition = -9
            ground.position = CGPoint(x: (ground.size.width / 5 + (ground.size.width * CGFloat(i))), y: -270)
            addChild(ground)
            
            let moveLeft = SKAction.moveBy(x: -ground.size.width - 500, y: 0, duration: 15)
            let moveReset = SKAction.moveBy(x: ground.size.width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            
            ground.run(moveForever)
        }
        
    }
    
    @objc func createBonus(){
        let randomX = GKRandomDistribution(lowestValue: 120, highestValue: 180).nextInt()
        let randomY = GKRandomDistribution(lowestValue: -15, highestValue: 15).nextInt()
        if randomX % 2 == 0 { //normal fish point, effect = +5 points
           // print("Normal Bonus spawned in")
            let sprite = SKSpriteNode(imageNamed: "fish")
            sprite.size = CGSize(width: 80, height: 70)
            sprite.name = "Bonus"
            assignTheBonusAbility(sprite: sprite, randomX: randomX, randomY: randomY)
        } else if randomX % 3 == 0 && randomX % 5 == 0{ //golden fish, effect = immortality for some seconds
            //print("Golden Bonus spawned in")
            let sprite = SKSpriteNode(imageNamed: "goldfish")
            sprite.size = CGSize(width: 80, height: 70)
            sprite.name = "GoldBonus"
            assignTheBonusAbility(sprite: sprite, randomX: randomX, randomY: randomY)
        } /*else { //extra bonus
            print("Extra Bonus spawned in")
            let sprite = SKSpriteNode(imageNamed: "extrafish")
            sprite.name = "ExtraBonus"
            assignTheBonusAbility(sprite: sprite, randomX: randomX, randomY: randomY)
        }*/
        
    }
}
