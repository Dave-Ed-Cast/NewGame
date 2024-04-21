//
//  AppDelegate.swift
//  NewGame
//
//  Created by Davide Castaldi on 16/04/24.
//

import SwiftUI

@main
struct AppDelegate: App {
    
    var body: some Scene {
        WindowGroup {
            ParentView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
