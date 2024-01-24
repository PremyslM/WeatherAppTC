//
//  WeatherDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Combine
import Foundation

class WeatherDataSource: ObservableObject {
    @Published var weather: [Weather]? {
        didSet {
            print("DEBUG: Weather setted ✅")
        }
    }// TODO: set temperature after cicking in location
    
    func setWeather(_ location: Location) {
        self.getTemperature(locationKey: location.key)
    }
    
    private func getTemperature(locationKey: String) {
        let accuweatherEndpoint = "https://dataservice.accuweather.com/currentconditions/v1/\(locationKey)"
        let parameters = ["apikey": Constants.API.API_KEY]
        
        APIService().fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Weather].self) { result in
            switch result {
            case .success(let temperature):
                DispatchQueue.main.async {
                    self.weather = temperature
                }
                print("Success ✅: \(self.weather)")
            case .failure(let error):
                print("Error: \(error)")
                // Handle errors appropriately
            }
        }
    }
    
}
