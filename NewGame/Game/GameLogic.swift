//
//  GameLogic.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import Foundation
import SwiftUI

class GameLogic: ObservableObject {
    
    static let shared: GameLogic = GameLogic()
    
    func restartGame(){
        self.currentScore = 0
        self.isGameOver = false
    }
    //general
    @Published var currentScore: Int = 0
    @Published var isGameOver = false
    //settings
    @AppStorage ("musicVolume") var musicVolume: Int = 5
    @AppStorage ("soundsVolume") var soundsVolume: Int = 5
    @AppStorage ("musicSwitch") var musicSwitch: Bool = true
    @AppStorage ("soundsSwitch") var soundsSwitch: Bool = true
    @Published var showPauseMenu: Bool = false
    @Published var firstGame : Bool = true
    
    func increaseScore(points: Int){
        self.currentScore = self.currentScore + points
    }
    
    func finishGame(){
        if self.isGameOver == false{
            self.isGameOver = true
        }
    }
    
    
}

