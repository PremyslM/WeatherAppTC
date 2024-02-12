//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 01.02.2024.
//

import Foundation

class WeatherInteractor {
    private let model: WeatherDataModel
    var weatherList: Weather?
    
    init(model: WeatherDataModel) {
        self.model = model
    }

    func setWeather(
        _ location: Location,
        completion: @escaping () -> Void
    ) {
        model.fetchWeather(locationKey: location.key) { weatherList in
            self.weatherList = weatherList.first
            completion()
        }
    }
}
