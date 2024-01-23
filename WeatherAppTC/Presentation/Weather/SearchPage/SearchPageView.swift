//
//  SearchPageView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 21.01.2024.
//

import SwiftUI


struct SearchPageView: View {
    @StateObject var locationDataSource: WeatherDataSource = WeatherDataSource()
    
    var body: some View {
        ZStack {
            Color.darkBg
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                DynamicGradientWeatherContainer(
                    content: LocationListView(locationList: locationDataSource.locations),
                    cornerRadius: .init(
                        topLeading: 35.0,
                        bottomLeading: 35.0,
                        bottomTrailing: 35.0,
                        topTrailing: 35.0
                    )
                )
                Spacer()
                
                CustomSearchBarView(
                    onSearchSubmit: locationDataSource.getLocation(cityName:)
                )
                    .padding(.top)
                    .foregroundStyle(.white)
            }
            .padding()
        }
        
    }
}

#Preview {
    SearchPageView()
}
