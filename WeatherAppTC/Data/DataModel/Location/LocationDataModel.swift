//
//  LocationDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class LocationDataModel {
    var locations: [Location]?
    
    func fetchLocations(cityName: String, completion: @escaping ([Location]?, Error?) -> Void) {
        let query = cityName
        let accuweatherEndpoint = Constants.API.Endpoints.locations.rawValue
        let parameters = ["apikey": Constants.API.API_KEY, "q": query]

        APIService().fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Location].self) { result in
            switch result {
            case .success(let cities):
                DispatchQueue.main.async {
                    completion(cities, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
}

