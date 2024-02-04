//
//  LocationListView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct LocationListView: View {
    @ObservedObject private var locationListPresenter: WeatherLocationListPresenter
    
    let locationList: [Location]
    let onItemTapped: (Location) -> Void
    
    init(locationListPresenter: WeatherLocationListPresenter, locationList: [Location], onItemTapped: @escaping (Location) -> Void) {
        self.locationListPresenter = locationListPresenter
        self.locationList = locationList
        self.onItemTapped = onItemTapped
    }
    
    var body: some View {
        List {
            ForEach(locationList) { location in
                HStack {
                    Text(location.localizedName)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text(location.country.localizedName)
                        .font(.footnote)
                }
                .foregroundStyle(.white)
                .onTapGesture {
                    self.onItemTapped(location)
                    locationListPresenter.setCurrentLocation(location: location)
                    print("DEBUG: \(locationListPresenter.weatherList)")
                }
            }
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .padding(.vertical)
    }
}
