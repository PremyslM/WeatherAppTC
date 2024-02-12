//
//  Constants.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation


final class Constants {
    
    // Nested structure to organize API-related constants
    struct API {
        // Enum defining various API endpoints
        enum Endpoints: String {
            case locations = "https://dataservice.accuweather.com/locations/v1/cities/autocomplete" // Endpoint for fetching locations based on autocomplete
            
            // Placeholder for weather endpoint (TODO: to be implemented)
            case weather = "temp" // TODO:
        }
        static let API_KEY: String = "VZQsYeGkGEU9FTGPUTCQ39pbVxTO3fiQ" // API key used for authentication
    }
}
