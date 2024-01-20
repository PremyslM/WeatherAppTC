//
//  Constants.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation


final class Constants {
    
    struct API {
        enum Endpoints: String {
            case location = "http://dataservice.accuweather.com/"
            case temperature = "temp" // TODO:
        }
        
        static let API_KEY: String = "VZQsYeGkGEU9FTGPUTCQ39pbVxTO3fiQ"
    }
    
    
}
