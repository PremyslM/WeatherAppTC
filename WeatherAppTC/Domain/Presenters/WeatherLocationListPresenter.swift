//
//  LocationListPresenter.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation
import Combine

class WeatherLocationListPresenter: ObservableObject {
    @Published var locationList: [Location]
    @Published var weatherList: [Weather]
    @Published var selectedLocation: Location?
    
    private let locationInteracotr: LocationListInteracor
    private let weatherInteractor: WeatherListInteractor

    init(
        _ locationInteractor: LocationListInteracor,
        _ weatherInteractor: WeatherListInteractor
    ) {
        self.locationList = []
        self.weatherList = []
        
        self.locationInteracotr = locationInteractor
        self.weatherInteractor = weatherInteractor
    }
    
    var metricTemperatureString: String {
        if let temp = weatherList.first?.temperature.metric.value {
            return "\(Int(temp.rounded()))°"
        }
        return "unknown"
    }
    
    var weatherTextString: String {
        if let weatherText = weatherList.first?.weatherText {
            return weatherText
        }
        return "unknown"
    }
    
    var windSpeedString: String {
        if let windSpeed = weatherList.first?.wind?.speed.metric.value {
            return "\(Int(windSpeed.rounded())) m/s"
        }
        return "unknown"
    }
    
    var selectedLocName: String {
        if let localizedName = selectedLocation?.localizedName {
            return localizedName
        }
        return "unknown"
    }
        
}


extension WeatherLocationListPresenter {
    func searchLocations(locationName: String) {
        locationInteracotr.searchLocations(locationKey: locationName) { locations in
            self.locationList = locations
        }
    }
    
    func setCurrentLocation(location: Location) {
        self.selectedLocation = location
    }
    
    func setWeather(_ location: Location) { // TODO: Async func
        self.weatherInteractor.setWeather(location) {
            self.weatherList = self.weatherInteractor.weatherList
        }
    }
    
}
