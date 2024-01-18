//
//  NetworkService.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation
import Combine


class NetworkService {
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func fetchData<T: Decodable>(path: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: baseURL + path) else {
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
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main) // Switch to the main thread for UI updates
            .eraseToAnyPublisher()
    }
}
