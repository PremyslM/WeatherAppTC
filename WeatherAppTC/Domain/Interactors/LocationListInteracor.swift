//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation


class LocationListInteracor {
    var locationList: [Location]? = nil
    private let model: LocationDataModel
    
    init(model: LocationDataModel) {
        self.model = model
    }        
    
    func searchLocations(
        locationKey key: String,
        completion: @escaping () -> Void
    ) {
        model.getLocation(cityName: key) { locations, success  in
            self.locationList = locations
            completion()
        }
    }
}
