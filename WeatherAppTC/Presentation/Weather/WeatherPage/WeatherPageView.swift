//
//  ContentView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

struct WeatherPageView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    WeatherPageView()
}
