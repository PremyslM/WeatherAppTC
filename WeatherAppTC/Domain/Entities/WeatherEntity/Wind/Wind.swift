//
//  Wind.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 04.02.2024.
//

import Foundation


struct Wind: Codable {
    let speed: Speed
    
    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
    }
    
    struct Speed: Codable {
        let metric: Metric
        
        enum CodingKeys: String, CodingKey {
            case metric = "Metric"
        }
    }
}
