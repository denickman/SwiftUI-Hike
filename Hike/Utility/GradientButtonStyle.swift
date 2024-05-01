//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Denis Yaremenko on 09.03.2024.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // conditional statement with nil coalescing
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
    }   
}
