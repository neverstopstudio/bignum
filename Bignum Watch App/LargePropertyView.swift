//
//  LargePropertyView.swift
//  Bignum Watch App
//
//  Created by Vladyslav on 29.03.2024.
//

import SwiftUI

struct Property {
    let title: String
    let value: String
}

struct LargePropertyView: View {
    @State private var currentIndex = 0
    private let properties: [Property] = [
        Property(title: "Distance", value: "15.2 km"),
        Property(title: "Energy", value: "320 kcal"),
        Property(title: "Heart Rate", value: "120 bpm")
    ]
    
    var body: some View {
        VStack {
            Text(properties[currentIndex].title.uppercased())
                .font(.system(size: 36))
                .padding()
            
            Text(properties[currentIndex].value)
                .font(.system(size: 50, weight: .bold))
                .padding()
            
            Spacer()
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < 0 && self.currentIndex < self.properties.count - 1 {
                        withAnimation {
                            self.currentIndex += 1
                        }
                    } else if value.translation.width > 0 && self.currentIndex > 0 {
                        withAnimation {
                            self.currentIndex -= 1
                        }
                    }
                }
        )
        .onAppear {
            // Load the last visible property
            // You can implement this using UserDefaults or any other storage mechanism
        }
        .onDisappear {
            // Save the last visible property
            // You can implement this using UserDefaults or any other storage mechanism
        }
    }
}

struct LargePropertyView_Previews: PreviewProvider {
    static var previews: some View {
        LargePropertyView()
    }
}
