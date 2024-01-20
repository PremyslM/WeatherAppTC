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
                DynamicGradientWeatherContainer(content: WeatherDataView())
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WeatherPageView()
}

struct DynamicGradientWeatherContainer<Content: View>: View {
    let content: Content
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemBlue).opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            content
        }
        .frame(maxHeight: 550)
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


struct WeatherDataView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "cloud.fill")
                .renderingMode(.original)
                .resizable()
                .symbolEffect(.bounce, options: .repeating, value: false)
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            
            VStack {
                HStack(alignment: .top) {
                    Text("16°")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundStyle(Color.white)
                }
                
                Text("Cloudy")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.white)
                
                Rectangle()
                    .fill(.white.opacity(0.6))
                    .frame(height: 1)
                    
                    .padding(.vertical, 50)
                
                HStack(spacing: 40) {
                    ForEach(0..<3) {_ in
                        VStack {
                            Image(systemName: "wind")
                                .font(.system(size: 24))
                                .padding(.bottom, 1)
                            Text("13 km/s")
                                .font(.system(size: 18, weight: .medium))
                            Text("Wind")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.8))
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
            Spacer(minLength: 12)
        }
        .padding(.horizontal)
    }
}
