//
//  Temperature.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

struct Temperature: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
    
    struct Metric: Codable {
        let value: Double?
        let unit: String?
        
        enum CodingKeys: String, CodingKey {
            case value = "Value"
            case unit = "Unit"
        }
    }

}
