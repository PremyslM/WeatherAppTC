//
//  LocationListView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct LocationListView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var presenter: WeatherLocationListPresenter
    
    let locationList: [Location]
    let onItemTapped: (Location) -> Void
    
    init(locationListPresenter: WeatherLocationListPresenter, locationList: [Location], onItemTapped: @escaping (Location) -> Void) {
        self.presenter = locationListPresenter
        self.locationList = locationList
        self.onItemTapped = onItemTapped
    }
    
    var body: some View {
        if presenter.locationList.isEmpty {
            LoadingTextView()
        } else {
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
                        presenter.onLocationItemTapped(location)
                        dismiss()
                    }
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .padding(.vertical)
        }
    }
}
