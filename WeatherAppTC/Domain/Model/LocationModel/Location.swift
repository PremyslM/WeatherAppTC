//
//  Location.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 18.01.2024.
//

import Foundation

struct Location: Codable {
    var version: Int
    var key: String
    var type: String
    var rank: Int
    var localizedName: String
    var country: Country
    var administrativeArea: AdministrativeArea

    enum CodingKeys: String, CodingKey {
        case version
        case key
        case type
        case rank
        case localizedName = "LocalizedName"
        case country
        case administrativeArea
    }
}


extension Location {
    static let MOCK_LOCATION = Location(
        version: 1,
        key: "SampleKey",
        type: "City",
        rank: 10,
        localizedName: "Sample City",
        country: Country(
            id: "US",
            localizedName: "United States"
        ),
        administrativeArea: AdministrativeArea(
            id: "001",
            localizedName: "Sample Administrative Area"
        )
    )
}
