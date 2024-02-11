//
//  LocationListPresenter.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation
import Combine

class WeatherLocationListPresenter: ObservableObject {
    @Published private var weatherList: Weather?
    @Published private var selectedLocation: Location?
    
    @Published var locationList: [Location]
    
    @Published var isLoading: Bool = true
    
    private let weatherIconProvider: WeatherIconProvider
    private let locationInteracotr: LocationListInteracor
    private let weatherInteractor: WeatherInteractor
    
    init(
        _ locationInteractor: LocationListInteracor,
        _ weatherInteractor: WeatherInteractor
    ) {
        self.locationList = []
        
        self.weatherIconProvider = WeatherIconProvider()
        self.locationInteracotr = locationInteractor
        self.weatherInteractor = weatherInteractor
    }
    
    var metricTemperatureString: String {
        if let temp = weatherList?.temperature.metric.value {
            return "\(Int(temp.rounded()))°"
        }
        return "unknown"
    }
    var weatherTextString: String {
        if let weatherText = weatherList?.weatherText {
            return weatherText
        }
        return "unknown"
    }
    var windSpeedString: String {
        if let windSpeed = weatherList?.wind?.speed.metric.value {
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
        if let pressure = weatherList?.pressure.metric.value {
            return "\(Int(pressure)) kPal"
        }
        return "unknwon"
    }
    var uvIndexString: String {
        if let uvIndex = weatherList?.uvIndex {
            return "\(uvIndex)"
        }
        return "unknown"
    }
    var feelsLikeTempString: String {
        if let flTemp = weatherList?.apparentTemperature.metric.value {
            return "Feels like \(Int(flTemp))°C"
        }
        return "unknown"
    }
    var weatherURLLinkString: String {
        if let urlLink = weatherList?.urlLink {
            return urlLink
        }
        return ""
    }
    var weatherSystemImage: String {
        guard let weatherIcon = weatherList?.weatherIcon else { return "" }
        return weatherIconProvider.getWeatherIcon(for: Int(weatherIcon))
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
    var locationLocName: String {
        guard let selectedLocationName = selectedLocation?.localizedName else { return "" }
        return selectedLocationName
    }
    
}


extension WeatherLocationListPresenter {
    func onLocationItemTapped(_ location: Location) {
        setWeather(location)
        setCurrentLocation(location: location)
    }
    
    func onSearchLocationButtonClicked(_ localizedName: String) {
        setLocationsList(for: localizedName)
    }
    
    func isLocationSelected() -> Bool {
        if selectedLocation == nil {
            return false
        }
        return true
    }
}


extension WeatherLocationListPresenter {
    private func setLocationsList(for localizedName: String) {
        locationInteracotr.searchLocations(locationKey: localizedName) {
            guard let locationList = self.locationInteracotr.locationList else { return }
            DispatchQueue.main.async {
                self.locationList = locationList
            }
        }
    }
    
    private func setWeather(_ location: Location) { // TODO: Async func
        self.weatherInteractor.setWeather(location) {
            guard let weatherList = self.weatherInteractor.weatherList else { return }
            DispatchQueue.main.async {
                self.weatherList = weatherList
            }
            self.isLoading = self.weatherInteractor.isLoading
        }
    }
    
    private func setCurrentLocation(location: Location) {
        self.selectedLocation = location
    }
}
