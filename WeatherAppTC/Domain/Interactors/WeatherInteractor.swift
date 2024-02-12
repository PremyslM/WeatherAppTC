//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 01.02.2024.
//

import Foundation

class WeatherInteractor {
    private let model: WeatherDataModel // Weather data model used for fetching weather data
    var weatherList: Weather? // Weather object to hold fetched weather data
    
    // Initializes the interactor with a weather data model
    init(model: WeatherDataModel) {
        self.model = model
    }

    // Method to set weather data for a specific location
    func setWeather(
        _ location: Location,
        completion: @escaping () -> Void
    ) {
        // Fetch weather data for the provided location key
        model.fetchWeather(locationKey: location.key) { weatherList in
            self.weatherList = weatherList.first // Assign the first weather data object to the weatherList property
            completion()
        }
    }
}
