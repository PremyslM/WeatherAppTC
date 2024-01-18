//
//  AdministrativeArea.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

struct AdministrativeArea: Codable {
    var id: String
    var localizedName: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
    }
}
