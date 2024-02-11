//
//  WeatherIcon.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 09.02.2024.
//

import Foundation

struct WeatherIconProvider {
    
    func getWeatherIcon(for weatherCode: Int) -> String {
        switch weatherCode {
        case 1:
            return "sun.max"
        case 2:
            return "sun.max.fill"
        case 3:
            return "cloud.sun"
        case 4:
            return "cloud.sun"
        case 5:
            return "cloud.sun"
        case 6:
            return "cloud"
        case 7:
            return "cloud.fill"
        case 8:
            return "cloud"
        case 11:
            return "cloud.fog"
        case 12:
            return "cloud.rain"
        case 13:
            return "cloud.sun.rain"
        case 14:
            return "cloud.sun.rain.fill"
        case 15:
            return "cloud.bolt.rain"
        case 16:
            return "cloud.sun.bolt"
        case 17:
            return "cloud.sun.bolt.fill"
        case 18:
            return "cloud.heavyrain"
        case 19:
            return "cloud.snow"
        case 20:
            return "cloud.sun.snow"
        case 21:
            return "cloud.sun.snow.fill"
        case 22:
            return "snow"
        case 23:
            return "cloud.snow"
        case 24:
            return "cloud.sleet"
        case 25:
            return "cloud.sleet"
        case 26:
            return "cloud.sleet"
        case 29:
            return "cloud.snow"
        case 30:
            return "thermometer.sun"
        case 31:
            return "thermometer.snowflake"
        case 32:
            return "wind"
        case 33:
            return "moon.stars"
        case 34:
            return "moon.stars.fill"
        case 35:
            return "cloud.moon"
        case 36:
            return "cloud.sun"
        case 37:
            return "cloud.moon"
        case 38:
            return "cloud"
        case 39:
            return "cloud.moon.rain"
        case 40:
            return "cloud.moon.rain.fill"
        case 41:
            return "cloud.moon.bolt"
        case 42:
            return "cloud.moon.bolt.fill"
        case 43:
            return "cloud.snow"
        case 44:
            return "cloud.snow"
        default:
            return "cloud"
        }
    }
}
