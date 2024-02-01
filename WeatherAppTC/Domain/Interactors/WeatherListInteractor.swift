//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 01.02.2024.
//

import Foundation


class WeatherListInteractor {
    private let model: WeatherDataModel
    
    init(model: WeatherDataModel) {
        self.model = model
    }
    
    func setWeather(_ location: Location) {
        model.getTemperature(locationKey: location.key)
    }
}
