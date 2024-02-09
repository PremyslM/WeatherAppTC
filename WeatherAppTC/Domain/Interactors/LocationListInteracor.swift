//
//  WeatherListInteractor.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation


class LocationListInteracor {
    let model: LocationDataModel
    
    init(model: LocationDataModel) {
        self.model = model
    }        
    
    func searchLocations(locationKey key: String, completion: @escaping ([Location]) -> Void) {
        model.getLocation(cityName: key) { locations, success  in
            completion(locations)
        }
    }
}
