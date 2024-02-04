//
//  Double+roundTo.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 04.02.2024.
//

import Foundation

extension Double {
    
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    
}
