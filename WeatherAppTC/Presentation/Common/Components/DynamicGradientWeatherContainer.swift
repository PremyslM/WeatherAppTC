//
//  GradientDataContainer.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct DynamicGradientWeatherContainer<Content: View>: View {
    let content: Content
    
    let cornerRadius: RectangleCornerRadii
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemBlue).opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            content
        }
        .frame(maxHeight: 550)
        .clipShape(
            UnevenRoundedRectangle(cornerRadii: cornerRadius,
                                   style: .continuous)
        )
        .shadow(color: .blue.opacity(0.8), radius: 50)
    }
}
