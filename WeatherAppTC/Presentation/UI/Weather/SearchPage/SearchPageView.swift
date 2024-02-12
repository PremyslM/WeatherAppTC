//
//  SearchPageView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 21.01.2024.
//

import SwiftUI


struct SearchPageView: View {
    @ObservedObject var presenter: WeatherLocationListPresenter
    
    var body: some View {
        ZStack {
            Color.darkBg
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                DynamicGradientWeatherContainer(
                    content: LocationListView(
                        locationListPresenter: presenter,
                        locationList: presenter.locationList,
                        onItemTapped: presenter.onLocationItemTapped
                    ),
                    maxHeight: 550,
                    cornerRadius: .init(
                        topLeading: 35.0,
                        bottomLeading: 35.0,
                        bottomTrailing: 35.0,
                        topTrailing: 35.0
                    )
                )
                Spacer()
                
                CustomSearchBarView(
                    onSearchSubmit: presenter.onSearchLocationButtonClicked
                )
                .padding(.top)
                .foregroundStyle(.white)
            }
            .padding()
        }
        
    }
}
