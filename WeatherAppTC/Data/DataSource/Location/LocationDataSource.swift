//
//  LocationDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation


class LocationDataSource: ObservableObject {
    private var apiService: APIService = APIService()
    
    @Published var locations: [Location] = []

    func getLocation(cityName: String) {
        let query = cityName
        let accuweatherEndpoint = "https://dataservice.accuweather.com/locations/v1/cities/autocomplete"
        let parameters = ["apikey": Constants.API.API_KEY, "q": query]

        apiService.fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Location].self) { result in
            switch result {
            case .success(let cities):
                DispatchQueue.main.async {
                    self.locations = cities
                }
                print("Success ✅: \(self.locations.count)")
            case .failure(let error):
                print("Error: \(error)")
                // Handle errors appropriately
            }
        }
    }
    
    
}
