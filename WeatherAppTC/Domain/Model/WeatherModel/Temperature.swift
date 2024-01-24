//
//  Temperature.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 24.01.2024.
//

import Foundation


struct Temperature: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}
