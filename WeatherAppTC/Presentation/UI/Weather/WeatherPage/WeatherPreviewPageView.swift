//
//  ContentView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

struct WeatherPreviewPageView: View {
    @State private var isSearchBtnClicked: Bool = false
    @ObservedObject private var locationPresenter: WeatherLocationListPresenter
    
    init() {
        let locationModel = LocationDataModel()
        let weatherModel = WeatherDataModel()
        let locationInteractor = LocationListInteracor(model: locationModel)
        let weatherInteractor = WeatherListInteractor(model: weatherModel)
        let presenter = WeatherLocationListPresenter(locationInteractor, weatherInteractor)
        
        self.locationPresenter = presenter
    }
    
    var body: some View {
        ZStack {
            Color.darkBg
            VStack {
                DynamicGradientWeatherContainer(
                    content: WeatherDataView(
                        onSearchBtnClick: searchButtonTapped,
                        presenter: locationPresenter
                    ),
                    cornerRadius: .init(
                        topLeading: 0.0,
                        bottomLeading: 75.0,
                        bottomTrailing: 75.0,
                        topTrailing: 0.0
                    )
                )
                .opacity(isSearchBtnClicked ? 0.3 : 1)
                
                WeatherCalendarView()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isSearchBtnClicked, content: {
            SearchPageView(wlPresenter: locationPresenter)
        })
    }
    
    private func searchButtonTapped() {
        withAnimation {
            self.isSearchBtnClicked.toggle()
        }
    }
    
}

#Preview {
    WeatherPreviewPageView()
}