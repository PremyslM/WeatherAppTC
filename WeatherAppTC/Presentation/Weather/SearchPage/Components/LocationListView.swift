//
//  LocationListView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct LocationListView: View {
    let locationList: [Location]
    let onItemTapped: (Location) -> Void
    
    var body: some View {
        List {
            ForEach(locationList, id: \.localizedName) { location in
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
                }
            }
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .padding(.vertical)
    }
}
