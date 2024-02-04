//
//  Weather.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 01.02.2024.
//

import Foundation

struct Weather: Codable {
    let weatherText: String
    let temperature: Temperature
    let wind: Wind?
    
    enum CodingKeys: String, CodingKey {
        case weatherText = "WeatherText"
        case temperature = "Temperature"
        case wind = "Wind"
    }
}
