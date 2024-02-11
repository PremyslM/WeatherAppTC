//
//  Metric.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 06.02.2024.
//

import Foundation

struct Metric: Codable {
    let value: Double
    let unit: String
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
    }
}
