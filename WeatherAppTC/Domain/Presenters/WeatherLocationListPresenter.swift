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
    
    @Published var isLoading: Bool = true
    
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
    var pressureString: String {
        if let pressure = weatherList.first?.pressure.metric.value {
            return "\(Int(pressure)) kPal"
        }
        return "unknwon"
    }
    var uvIndexString: String {
        if let uvIndex = weatherList.first?.uvIndex {
            return "\(uvIndex)"
        }
        return "unknown"
    }
    var feelsLikeTempString: String {
        if let flTemp = weatherList.first?.apparentTemperature.metric.value {
            return "\(Int(flTemp))°"
        }
        return "unknown"
    }
    var weatherDetailList: [WeatherDetailModel] {
        let result = [
            WeatherDetailModel(
                label: "Wind",
                content: windSpeedString,
                systemImage: "wind"),
            WeatherDetailModel(
                label: "Pressure",
                content: pressureString,
                systemImage: "barometer"),
            WeatherDetailModel(
                label: "UV",
                content: uvIndexString,
                systemImage: "sun.max.fill"),            
        ]
        return result
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
            guard let weatherList = self.weatherInteractor.weatherList else { return }
            self.weatherList = weatherList
            self.isLoading = self.weatherInteractor.isLoading
        }
    }
    
}
