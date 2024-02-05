//
//  Pressure.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 05.02.2024.
//

import Foundation

struct Pressure: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
    
    struct Metric: Codable {
        let value: Double
        
        enum CodingKeys: String, CodingKey {
            case value = "Value"
        }
    }
}
