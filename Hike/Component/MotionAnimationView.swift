//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Denis Yaremenko on 10.03.2024.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    @State private var randomCircle: Int = .random(in: 6...12)
    @State private var isAnimating: Bool = false
    
      
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(),
                              y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(
                                stiffness: 0.25,
                                damping: 0.25
                            )
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup() // high perfromance metal rendering, powered by metal
    }
}

#Preview {
        MotionAnimationView()
        .background(Circle()
            .fill(.teal)
        )  
}

extension MotionAnimationView {
    // MARK: - Functions
    
    // 1. Random coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    
    // 2. Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 8...80))
    }
    
    
    // 3. Random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    
    // 4. Random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    
    // 5. Random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
}
