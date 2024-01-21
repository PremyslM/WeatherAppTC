//
//  ContentView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

struct WeatherPageView: View {
    @State private var isSearchBtnClicked: Bool = false
    
    var body: some View {
        ZStack {
            Color.darkBg
            VStack {
                DynamicGradientWeatherContainer(
                    content: WeatherDataView(onSearchBtnClick: searchButtonTapped),
                    cornerRadius: .init(
                        topLeading: 0.0,
                        bottomLeading: 75.0,
                        bottomTrailing: 75.0,
                        topTrailing: 0.0
                    )
                )
                
                WeatherDateView()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isSearchBtnClicked, content: {
            SearchPageView()
        })
    }
    
    private func searchButtonTapped() {
        self.isSearchBtnClicked.toggle()
    }
}

#Preview {
    WeatherPageView()
}

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


struct WeatherDataView: View {
    let onSearchBtnClick: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                self.onSearchBtnClick()
            } label: {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Prague")
                        .fontWeight(.semibold)
                }
                .padding()
                .foregroundStyle(.white)
                .font(.system(size: 24))
            }
            
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
                    .padding(.top, 50)
                
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
                .padding(.vertical, 30)
            }
        }
        .padding(.horizontal)
        
    }
}


struct WeatherDateView: View {
    var body: some View {
        VStack(spacing: 35) {
            ForEach(0..<3) { _ in
                HStack {
                    Text("Mon")
                        .opacity(0.5)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "cloud.rain.fill")
                            .renderingMode(.original)
                        Text("Rainy")
                            .opacity(0.5)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("18°")
                            .opacity(0.9)
                        Text("12°")
                            .opacity(0.5)
                    }
                }
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(.white)
            }
        }
        .padding(30)
    }
}
