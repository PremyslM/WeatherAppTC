//
//  NetworkService.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation
import Combine

class APIService {
    /*
    private let baseURL: String
    private let apiKey: String // Your API key
    
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func fetchData<T: Decodable>(path: String) -> AnyPublisher<T, Error> {
        guard var urlComponents = URLComponents(string: baseURL + path) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        // Append API key as a query parameter
        let apiKeyQueryItem = URLQueryItem(name: "apikey", value: apiKey)
        urlComponents.queryItems = [apiKeyQueryItem]
        
        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error in
                // Handle network errors
                return error as Error
            }
            .flatMap { (data, response) -> AnyPublisher<T, Error> in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
                }
                
                return Just(data)
                    .decode(type: T.self, decoder: JSONDecoder())
                    .mapError { error in
                        // Handle decoding errors
                        return error as Error
                    }
                    .map { decodedData -> T in
                        // Handle nil values or provide default values here
                        if let optionalData = decodedData as? String {
                            // Check for nil and provide default value
                            return optionalData as! T
                        }
                        return decodedData
                    }
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main) // Switch to the main thread for UI updates
            .eraseToAnyPublisher()
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
}

