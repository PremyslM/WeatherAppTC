//
//  LocationListPresenter.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation

class WeatherLocationListPresenter: ObservableObject {
    // Published properties for weather, selected location, location list, and loading state.
    @Published private var weatherList: Weather?
    @Published private var selectedLocation: Location?
    @Published var locationList: [Location] 
    
    // Dependencies for interacting with weather and location data.
    private let weatherIconProvider: WeatherIconProvider
    private let locationInteractor: LocationListInteracor
    private let weatherInteractor: WeatherInteractor
    
    // Initialize the presenter with required dependencies.
    init(
        _ locationInteractor: LocationListInteracor,
        _ weatherInteractor: WeatherInteractor
    ) {
        self.locationList = []
        
        self.weatherIconProvider = WeatherIconProvider()
        self.locationInteractor = locationInteractor
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
    
    var locationCountryName: String {
        guard let selectedLocationName = selectedLocation?.country.localizedName else { return "" }
        return selectedLocationName
    }
}

// Extension containing methods for interacting with the presenter.
extension WeatherLocationListPresenter {
    // Method called when a location item is tapped.
    func onLocationItemTapped(_ location: Location) {
        resetSelectedData()
        setWeather(location)
        setCurrentLocation(location: location)
    }
    
    // Method called when the search location button is clicked.
    func onSearchLocationButtonClicked(_ localizedName: String) {
        let trimmedLocName: String = localizedName.trimmingCharacters(in: .whitespaces)
        setLocationsList(for: trimmedLocName)
    }
    
    // Method to check if a location is selected.
    func isLocationSelected() -> Bool {
        selectedLocation != nil
    }
}

// MARK: - Private Methods

extension WeatherLocationListPresenter {
    private func setLocationsList(for localizedName: String) {
        locationInteractor.searchLocations(locationKey: localizedName) { [weak self] in
            guard let locationList = self?.locationInteractor.locationList else { return }
            DispatchQueue.main.async {
                self?.locationList = locationList
            }
        }
    }
    
    private func resetSelectedData() {
        self.selectedLocation = nil
        self.weatherList = nil
    }
    
    private func setWeather(_ location: Location) { // TODO: Async func
        self.weatherInteractor.setWeather(location) { [weak self] in
            guard let weatherList = self?.weatherInteractor.weatherList else { return }
            DispatchQueue.main.async {
                self?.weatherList = weatherList
            }
        }
    }
    
    private func setCurrentLocation(location: Location) {
        selectedLocation = location
    }
}
