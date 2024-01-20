//
//  ContentView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

struct WeatherPageView: View {
    var body: some View {
        ZStack {
            VStack {
                DynamicGradientWeatherContainer()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WeatherPageView()
}

struct DynamicGradientWeatherContainer: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemBlue).opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .frame(height: 600)
        .clipShape(
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 0.0,
                bottomLeading: 75.0,
                bottomTrailing: 75.0,
                topTrailing: 0.0),
                                   style: .continuous)
        )
        .shadow(color: .blue.opacity(0.6), radius: 20)
    }
}
