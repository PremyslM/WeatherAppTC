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
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(
        _ locationInteractor: LocationListInteracor,
        _ weatherInteractor: WeatherListInteractor
    ) {
        self.locationList = []
        self.weatherList = []
        
        self.locationInteracotr = locationInteractor
        self.weatherInteractor = weatherInteractor
    }
    
    
    
    func searchLocations(locationName: String) {
        locationInteracotr.searchLocations(locationKey: locationName) { locations in
            self.locationList = locations
        }
    }
    
    func setCurrentLocation(location: Location) {
        self.selectedLocation = location
    }
    
    func setWeather(_ location: Location) {
        self.weatherInteractor.setWeather(location)
    }
}
