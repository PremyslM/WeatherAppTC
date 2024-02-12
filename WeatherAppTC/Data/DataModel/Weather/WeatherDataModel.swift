//
//  WeatherDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class WeatherDataModel {
    
    // Method to fetch weather data for a given location key
    func fetchWeather(
        locationKey: String,
        completion: @escaping ([Weather]) -> Void
    ) {
        // Construct the AccuWeather API endpoint URL for current conditions using the location key
        let accuweatherEndpoint = "https://dataservice.accuweather.com/currentconditions/v1/\(locationKey)"
        
        // Define parameters for the API request, including the API key and details parameter
        let parameters = [
            "apikey": Constants.API.API_KEY,
            "details": "true"
        ]
        
        // Use the APIService to fetch data from the API endpoint
        APIService().fetchData(
            from: accuweatherEndpoint,
            parameters: parameters,
            responseType: [Weather].self
        ) { result in
            // Handle the result of the API request
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(weather) // Execute the completion handler on the main thread with the fetched weather data
                }
            case .failure(let error):
                fatalError(error.localizedDescription) // If the request fails, log the error
            }
        }
    }
}
