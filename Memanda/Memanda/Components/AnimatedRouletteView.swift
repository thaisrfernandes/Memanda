//
//  AnimatedRouletteView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 02/12/21.
//

import SwiftUI

struct AnimatedRouletteView: View {
    @State var isRotated = false
    
    let rouletteHeight = getHeight(for: 321.84)

    var animation: Animation {
        Animation
            .easeInOut(duration: 1.8)
            .delay(2)
    }
    
    var degree: Double {
        var randomNumber = Int.random(in: 0..<360)
        
        let cantBe = [0, 40, 80, 120, 160, 200, 240, 280, 320, 360]
        
        if cantBe.contains(randomNumber) {
            if Bool.random() {
                randomNumber -= 1
            } else {
                randomNumber += 1
            }
        }
        
        return Double(randomNumber) + (360 * 3)
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("roulette")
                .frame(width: getWidth(for: 321.84), height: rouletteHeight)
                .rotationEffect(Angle.degrees(isRotated ? degree : 0))
                .animation(animation)

            Image("Mascot")
            
            Image("Arrow")
                .frame(width: getWidth(for: 41), height: getHeight(for: 41))
                .offset(x: 0, y: (-140 * UIScreen.main.bounds.height) / 926)
        }
        .onAppear {
            self.isRotated = true
        }
    }
}

