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
        Property(title: "Distance", value: "5.2 km"),
        Property(title: "Energy Burned", value: "320 kcal"),
        Property(title: "Avg Heart Rate", value: "120 bpm")
    ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(properties.indices, id: \.self) { index in
                VStack {
                    Text(properties[index].title.uppercased())
                        .font(.title)
                        .padding()
                    
                    Text(properties[index].value)
                        .font(.system(size: 60, weight: .bold))
                        .padding()
                    
                    Spacer()
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

struct LargePropertyView_Previews: PreviewProvider {
    static var previews: some View {
        LargePropertyView()
    }
}
