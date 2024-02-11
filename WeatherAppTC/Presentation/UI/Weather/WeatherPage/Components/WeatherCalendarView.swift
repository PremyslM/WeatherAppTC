//
//  WeatherCalendarView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct WeatherCalendarView: View {
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
