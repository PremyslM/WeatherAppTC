//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 01.02.2024.
//

import Foundation

class WeatherInteractor {
    var weatherList: Weather? = nil {
        didSet {
            isLoading = false
        }
    }
    var isLoading: Bool = true
    private let model: WeatherDataModel
    
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
