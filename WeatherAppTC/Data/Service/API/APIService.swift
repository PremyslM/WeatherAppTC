//
//  NetworkService.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

class APIService {
    
    // Method to fetch data from a given endpoint
    func fetchData<T: Codable>(
        from endpoint: String,
        parameters: [String: String],
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        // Construct URL components using the provided endpoint and parameters
        var components = URLComponents(string: endpoint)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        // Ensure the URL is valid
        guard let url = components?.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        // Create a URLSession data task to fetch data from the URL
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle any errors that occur during the data task
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            // Ensure data is received
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            // Decode the received data into the specified type using JSONDecoder
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                // Handle decoding errors
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume() // Resume the data task
    }
}
