//
//  SearchPageView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 21.01.2024.
//

import SwiftUI


struct SearchPageView: View {
    @ObservedObject var wlPresenter: WeatherLocationListPresenter
    
    var body: some View {
        ZStack {
            Color.darkBg
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                DynamicGradientWeatherContainer(
                    content: LocationListView(
                        locationListPresenter: wlPresenter,
                        locationList: wlPresenter.locationList,
                        onItemTapped: wlPresenter.setWeather
                    ),
                    cornerRadius: .init(
                        topLeading: 35.0,
                        bottomLeading: 35.0,
                        bottomTrailing: 35.0,
                        topTrailing: 35.0
                    )
                )
                Spacer()
                
                CustomSearchBarView(
                    onSearchSubmit: wlPresenter.searchLocations
                )
                    .padding(.top)
                    .foregroundStyle(.white)
            }
            .padding()
        }
        
    }
}
