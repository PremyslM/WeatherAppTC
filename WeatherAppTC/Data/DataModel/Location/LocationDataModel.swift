//
//  LocationDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class LocationDataModel {
    var locations: [Location]?
    
    func getLocation(cityName: String, completion: @escaping ([Location]) -> Void) {
        let query = cityName
        let accuweatherEndpoint = "https://dataservice.accuweather.com/locations/v1/cities/autocomplete"
        let parameters = ["apikey": Constants.API.API_KEY, "q": query]

        APIService().fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Location].self) { result in
            switch result {
            case .success(let cities):
                DispatchQueue.main.async {
                    completion(cities)
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
}

