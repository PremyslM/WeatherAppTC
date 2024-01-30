//
//  LocationListPresenter.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation
import Combine


class LocationListPresenter: ObservableObject {
    private let interactor: LocationListInteractor
    
    @Published var locationList: [Location] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: LocationListInteractor) {
        self.interactor = interactor
        searchLocations(locationName: "Prague")
    }
    
    func searchLocations(locationName: String) {
        interactor.searchLocations(locationKey: locationName) { locations in
            self.locationList = locations
        }
    }
}
