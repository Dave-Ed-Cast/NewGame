//
//  MainMenuButton.swift
//  NewGame
//
//  Created by Davide Castaldi on 17/04/24.
//

import SwiftUI

struct MainMenuButton: View {
    
    var optionToExecute: (() -> Void)?
    
    var buttonImage: String
    var pressedImage: String
    
    @State private var isPressed: Bool = false
    var textView: Text? = nil
    var textColor: Color? = .white
    var textOffset: Int? = nil
    var imageView: Image? = nil
    
    var body: some View {
        ZStack {
            Image(isPressed ? pressedImage : buttonImage)
                .interpolation(.none)
                .resizable()
            
            if let textView{
                textView.offset(x: CGFloat(textOffset != nil ? textOffset! : 0))
                
                    .offset(y: isPressed ? -1 : -5)
                    .opacity(isPressed ? 0.5 : 1)
            }
            if let imageView {
                imageView
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .offset(y: isPressed ? 0 : -5)
                    .opacity(isPressed ? 0.5 : 1)
                    .offset(y: -4)
                
            }
        }
        .foregroundStyle(textColor ?? .white).gesture(DragGesture(minimumDistance: 0).onChanged { _ in
            isPressed = true
        }.onEnded{ _ in
            isPressed = false
            optionToExecute?()
        })
    }
    
}

#Preview {
    MainMenuButton(buttonImage: "", pressedImage: "")
}
