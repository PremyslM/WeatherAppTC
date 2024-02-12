//
//  ContentView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

struct WeatherPreviewPageView: View {
    @ObservedObject private var presenter: WeatherLocationListPresenter
    @State private var isSearchBtnClicked: Bool = false
    
    init() {
        let locationModel = LocationDataModel()
        let weatherModel = WeatherDataModel()
        let locationInteractor = LocationListInteracor(model: locationModel)
        let weatherInteractor = WeatherInteractor(model: weatherModel)
        let presenter = WeatherLocationListPresenter(locationInteractor, weatherInteractor)
        
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {            
            if !presenter.isLocationSelected() {
                NavSearchButtonView(onClickAction: searchButtonTapped)
            } else {
                VStack {
                    DynamicGradientWeatherContainer(
                        content: WeatherDataView(
                            onSearchBtnClick: searchButtonTapped,
                            presenter: presenter
                        ),
                        maxHeight: 550,
                        cornerRadius: .init(
                            topLeading: 0.0,
                            bottomLeading: 75.0,
                            bottomTrailing: 75.0,
                            topTrailing: 0.0
                        )
                    )
                    .opacity(isSearchBtnClicked ? 0.3 : 1)
                    
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $isSearchBtnClicked, content: {
            SearchPageView(presenter: presenter)
        })
        .ignoresSafeArea()
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
