//
//  WeatherDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class WeatherDataModel {
    //var weatherList: [Weather]?
    
    /*
    func setWeather(_ location: Location) {
        self.getTemperature(locationKey: location.key)
    }
     */
    
    func getTemperature(
        locationKey: String,
        completion: @escaping ([Weather]) -> Void
    ) {
        let accuweatherEndpoint = "https://dataservice.accuweather.com/currentconditions/v1/\(locationKey)"
        let parameters = ["apikey": Constants.API.API_KEY]
        
        APIService().fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Weather].self) { result in
            switch result {
            case .success(let temperature):
                DispatchQueue.main.async {
                    //self.weatherList = temperature
                    completion(temperature)
                }
            case .failure(let error):
                print("Error: \(error)")
                // Handle errors appropriately
            }
        }
    }
    
}
