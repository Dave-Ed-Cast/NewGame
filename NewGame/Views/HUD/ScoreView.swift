//
//  SwiftUIView.swift
//  NewGame
//
//  Created by Davide Castaldi on 20/04/24.
//

import SwiftUI

struct ScoreView: View {
    
    @ObservedObject var gameLogic: GameLogic
    var body: some View {
        Spacer()
        HStack{
            Text("SCORE: \(gameLogic.currentScore)")
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.white)
            Spacer()
        }
        
    }
}

#Preview {
    ScoreView(gameLogic: GameLogic.shared)
}
