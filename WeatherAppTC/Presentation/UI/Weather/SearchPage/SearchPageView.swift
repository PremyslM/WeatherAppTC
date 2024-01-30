//
//  SearchPageView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 21.01.2024.
//

import SwiftUI


struct SearchPageView: View {
//    @StateObject var locationDataModel: LocationDataModel = LocationDataModel()
    @ObservedObject var weatherDataSource: WeatherDataSource
    
    @ObservedObject var locationPresenter: LocationListPresenter
    
    var body: some View {
        ZStack {
            Color.darkBg
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                DynamicGradientWeatherContainer(
                    content: LocationListView(
                        locationList: locationPresenter.locationList,
                        onItemTapped: weatherDataSource.setWeather
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
                    onSearchSubmit: locationPresenter.searchLocations
                )
                    .padding(.top)
                    .foregroundStyle(.white)
            }
            .padding()
        }
    }
}
