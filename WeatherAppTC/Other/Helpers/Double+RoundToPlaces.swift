//
//  Double+RoundToPlaces.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 24.01.2024.
//

import Foundation

extension Double {
    
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
