//
//  WeatherDetailModel.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 06.02.2024.
//

import Foundation

struct WeatherDetailModel {
    let label: String
    let value: Double
    let systemImage: String
    
    var valueInt: Int {
        return Int(value)
    }
}
