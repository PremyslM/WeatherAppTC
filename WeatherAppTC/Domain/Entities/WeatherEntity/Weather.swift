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
    let pressure: Pressure
    let uvIndex: Int32
    let apparentTemperature: ApparentTemperature
    let urlLink: String
    let weatherIcon: Int32
    
    enum CodingKeys: String, CodingKey {
        case weatherText = "WeatherText"
        case temperature = "Temperature"
        case wind = "Wind"
        case pressure = "Pressure"
        case uvIndex = "UVIndex" 
        case apparentTemperature = "ApparentTemperature"
        case urlLink = "Link"
        case weatherIcon = "WeatherIcon"
    }
}
