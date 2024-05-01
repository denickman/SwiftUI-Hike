//
//  CardView.swift
//  Hike
//
//  Created by Denis Yaremenko on 03.03.2024.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - Functions
    
    func randomImage() {
        print("--- Button was pressed ---")
        print("Status: Old image number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random number generated = \(randomNumber)")
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        print("Result: New image number = \(imageNumber)")
        print("--- The end ---")
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                
                // MARK: - Header
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight,
                                    .customGrayMedium
                                ],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a Sheet
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible) // top indicator for user experience
                                .presentationDetents([.medium, .large]) // Presentation detends
                            // 50% - medium
                            // 100% - large
                            // - custom
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family")
                        .multilineTextAlignment(.center)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: Header
                .padding(.horizontal, 30)
                
                
                
                // MARK: - Main content
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.5), value: imageNumber)
                    // value change triggers the animation
                }
                
                // MARK: - Footer
                
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.2, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                .cornerRadius(40)
                
            } //: ZSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
