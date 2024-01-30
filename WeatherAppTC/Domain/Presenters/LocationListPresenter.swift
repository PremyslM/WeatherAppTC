//
//  LocationListPresenter.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 30.01.2024.
//

import Foundation
import Combine


class LocationListPresenter: ObservableObject {
    @Published var locationList: [Location] = []
    @Published var selectedLocation: Location? {
        didSet {
            print("---------- SETTED (\(selectedLocation?.localizedName ?? "")) ----------")
        }
    }
    
    private let interactor: LocationListInteractor
    private var cancellables = Set<AnyCancellable>()
    
    
    init(interactor: LocationListInteractor) {
        self.interactor = interactor
        //searchLocations(locationName: "Prague")
    }
    
    func searchLocations(locationName: String) {
        interactor.searchLocations(locationKey: locationName) { locations in
            self.locationList = locations
        }
    }
    
    func setCurrentLocation(location: Location) {
        self.selectedLocation = location
    }
}
