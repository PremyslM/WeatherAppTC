//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation


class LocationListInteracor {
    var locationList: [Location]? // Array to hold location objects
    private let model: LocationDataModel // Location data model used for fetching location data
    
    // Initializes the interactor with a location data model
    init(model: LocationDataModel) {
        self.model = model
    }
    
    // Method to search for locations based on a key
    func searchLocations(
        locationKey key: String,
        completion: @escaping () -> Void
    ) {
        // Fetch locations from the model based on the provided key
        model.fetchLocations(cityName: key) { locations, success  in
            self.locationList = locations // Assign fetched locations to the location list
            completion()
        }
    }
}
