//
//  LocationDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation


class LocationDataSource: ObservableObject {
    @Published var locations: [Location] = []
    
    private func fetchData<T: Codable>(from endpoint: String, parameters: [String: String], responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var components = URLComponents(string: endpoint)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = components?.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }

    func getLocation(cityName: String) {
        let query = cityName
        let accuweatherEndpoint = "https://dataservice.accuweather.com/locations/v1/cities/autocomplete"
        let parameters = ["apikey": Constants.API.API_KEY, "q": query]

        fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Location].self) { result in
            switch result {
            case .success(let cities):
                self.locations = cities
                print("Success ✅: \(self.locations.count)")
            case .failure(let error):
                print("Error: \(error)")
                // Handle errors appropriately
            }
        }
    }
    
    
}
