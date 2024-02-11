//
//  WeatherAppTCApp.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

@main
struct WeatherAppTCApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                WeatherPreviewPageView()
            }
        }
    }
}
