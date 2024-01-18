//
//  WeatherDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class WeatherDataSource {
    let networkService = NetworkService(baseURL: Constants.API.Endpoints.temperature.rawValue)

    func fetchData() {
        let cancellable = networkService.fetchData(path: "/data")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("DEBUG: Success ✅")
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { (data: Temperature) in
                // Handle received data
                print("Received data: \(data)")
            })
    }
}
