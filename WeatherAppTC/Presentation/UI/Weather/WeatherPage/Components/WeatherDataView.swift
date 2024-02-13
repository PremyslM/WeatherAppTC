//
//  WeatherDataView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct WeatherDataView: View {
    let onSearchBtnClick: () -> Void // Callback for handling search button click
    let presenter: WeatherLocationListPresenter // Presenter object responsible for managing weather location data
    
    // State variable to track link button click
    @State private var linkButtonClicked: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    // Button for triggering search action
                    Button {
                        self.onSearchBtnClick()
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(presenter.selectedLocName)
                                    .fontWeight(.semibold)
                                Image(systemName: "location.magnifyingglass")
                            }
                            Text(presenter.locationCountryName)
                                .font(.footnote)
                        }
                        .padding()
                        .font(.system(size: 18))
                    }
                    
                    Spacer()
                    
                    // Button for displaying a link
                    Image(systemName: "link")
                        .onTapGesture {
                            self.linkButtonClicked.toggle()
                        }
                        .sheet(isPresented: $linkButtonClicked, content: {
                            WebView(url: presenter.weatherURLLinkString)
                        })
                }
                .foregroundStyle(.white)
                
                // Display weather icon
                Image(systemName: presenter.weatherSystemImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
                    .foregroundStyle(.white)
                
                VStack {
                    // Display temperature
                    HStack(alignment: .top) {
                        Text(presenter.metricTemperatureString)
                            .font(.system(size: 64, weight: .bold))
                            .foregroundStyle(Color.white)
                    }
                    
                    // Display "feels like" temperature
                    Text(presenter.feelsLikeTempString)
                        .font(.footnote)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    // Display weather description
                    Text(presenter.weatherTextString) // for example: cloudy
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                    
                    // Divider
                    Rectangle()
                        .fill(.white.opacity(0.6))
                        .frame(height: 1)
                        .padding(.top, 50)
                    
                    // Display weather details
                    HStack(spacing: 40) {
                        ForEach(presenter.weatherDetailList, id: \.label) { detailItem in
                            VStack {
                                Image(systemName: detailItem.systemImage)
                                    .font(.system(size: 24))
                                    .padding(.bottom, 1)
                                Text(detailItem.label)
                                    .font(.system(size: 18, weight: .medium))
                                Text(detailItem.content)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                            .foregroundStyle(.white)
                        }
                    }
                    .padding(.vertical, 30)
                }
                
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal)
        }
        .safeAreaPadding(.vertical, 80) // Apply safe area padding
    }
}
