//
//  WeatherDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Combine
import Foundation

class WeatherDataSource: ObservableObject {
    @Published var weather: Temperature? // TODO: set temperature after cicking in location        
    
    func getTemperature(locationKey: String) {
        let accuweatherEndpoint = "https://dataservice.accuweather.com/currentconditions/v1/\(locationKey)"
        let parameters = ["apikey": Constants.API.API_KEY]
        
        APIService().fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: Temperature.self) { result in
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
