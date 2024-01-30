//
//  ContentView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 17.01.2024.
//

import SwiftUI

struct WeatherPreviewPageView: View {
    @State private var isSearchBtnClicked: Bool = false
    
    @StateObject var weatherDataSource: WeatherDataSource = WeatherDataSource()
    
    var body: some View {
        ZStack {
            Color.darkBg
            VStack {
                DynamicGradientWeatherContainer(
                    content: WeatherDataView(
                        onSearchBtnClick: searchButtonTapped,
                        temperature: weatherDataSource.weather ),
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
            SearchPageView(weatherDataSource: weatherDataSource, locationPresenter: getLocationPresenter())
        })
    }
    
    private func searchButtonTapped() {
        withAnimation {
            self.isSearchBtnClicked.toggle()
        }
    }
    
    func getLocationPresenter() -> LocationListPresenter { // TODO: Make as a protocol "Presenter"
        let model = LocationDataModel()
        let interactor = LocationListInteractor(model: model)
        let presenter = LocationListPresenter(interactor: interactor)
        return presenter
    }
}

#Preview {
    WeatherPreviewPageView()
}
