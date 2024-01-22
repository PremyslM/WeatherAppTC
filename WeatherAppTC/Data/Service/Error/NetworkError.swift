//
//  NetworkError.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

/*
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}*/

enum NetworkError: Error {
    case invalidURL
    case networkError(Error)
    case noData
    case invalidResponse
    case decodingError(Error)
}
