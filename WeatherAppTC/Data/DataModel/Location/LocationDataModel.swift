//
//  LocationDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class LocationDataModel {
    var locations: [Location]? // Array to hold location objects
    
    // Method to fetch locations based on city name
    func fetchLocations(cityName: String, completion: @escaping ([Location]?, Error?) -> Void) {
        let query = cityName
        let accuweatherEndpoint = Constants.API.Endpoints.locations.rawValue // Define the AccuWeather API endpoint for locations
        let parameters = ["apikey": Constants.API.API_KEY, "q": query] // Define the parameters for the API request
        
        // Call the fetchData method of APIService to fetch data
        APIService().fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Location].self) { result in
            switch result {
            case .success(let cities):
                DispatchQueue.main.async {
                    completion(cities, nil) // Call the completion handler with the fetched cities on the main thread
                }
            case .failure(let error):
                completion(nil, error) // Call the completion handler with the error if the request fails
            }
        }
    }
}

