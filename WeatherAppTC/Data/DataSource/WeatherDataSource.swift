//
//  WeatherDataSource.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Combine
import Foundation

class WeatherDataSource {
    /*let networkService = NetworkService(
        baseURL: Constants.API.Endpoints.location.rawValue,
        apiKey: "VZQsYeGkGEU9FTGPUTCQ39pbVxTO3fiQ"
    )
    var cancellables: Set<AnyCancellable> = []

    func fetchData() {
        
        let cancellable = networkService.fetchData(path: "/locations/v1/cities/autocomplete")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:                    
                    break
                case .failure(let error):
                    print("---- HERE 💀")
                    print("Error: \(error)")
                }
            }, receiveValue: { (data: Location) in
                // Assuming YourModel is the expected model from the API
                // Handle received data
                print("Received data: \(data)")
            })

        // Store the cancellable to keep it alive until completion
        cancellables.insert(cancellable)
    }
    */
    
    func fetchData<T: Codable>(from endpoint: String, parameters: [String: String], responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
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

    func getData() {
        let query = "New York"
        let accuweatherEndpoint = "https://dataservice.accuweather.com/locations/v1/cities/autocomplete"
        let parameters = ["apikey": Constants.API.API_KEY, "q": query]

        fetchData(from: accuweatherEndpoint, parameters: parameters, responseType: [Location].self) { result in
            switch result {
            case .success(let cities):
                print("Cities: \(cities)")
                // Handle the received data accordingly
            case .failure(let error):
                print("Error: \(error)")
                // Handle errors appropriately
            }
        }
    }
}
