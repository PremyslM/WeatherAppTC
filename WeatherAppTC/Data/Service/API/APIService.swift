//
//  NetworkService.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation
import Combine

enum NetworkState: Equatable {
    case idle
    case loading
    case loaded
    case error(NetworkError)

    static func == (lhs: NetworkState, rhs: NetworkState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
             (.loading, .loading),
             (.loaded, .loaded):
            return true
        case let (.error(lhsError), .error(rhsError)):
            return true
        default:
            return false
        }
    }
}

class APIService {
    @Published private var networkState: NetworkState = .idle
    
    var isLoading: Bool {
        return networkState == .loading
    }
    
    func fetchData<T: Codable>(from endpoint: String, parameters: [String: String], responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        // Při začátku načítání nastavte stav na .loading
        networkState = .loading
        
        var components = URLComponents(string: endpoint)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = components?.url else {
            completion(.failure(.invalidURL))
            networkState = .error(.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Při ukončení požadavku nastavte stav na .loaded nebo .error podle situace
            defer {
                DispatchQueue.main.async {
                    if self.networkState == .loading {
                        self.networkState = (error != nil) ? .error(.networkError(error!)) : .loaded
                    }
                }
            }
            
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
