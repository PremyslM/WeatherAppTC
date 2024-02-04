//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 01.02.2024.
//

import Foundation


class WeatherListInteractor {
    var weatherList: [Weather]
    private let model: WeatherDataModel
    
    init(model: WeatherDataModel) {
        self.model = model
        self.weatherList = []
    }
    
    func setWeather(
        _ location: Location,
        completion: @escaping () -> Void
    ) { // TODO: Async func
        model.getTemperature(locationKey: location.key) { weatherList in
            self.weatherList = weatherList
            completion()
        }
    }
}
