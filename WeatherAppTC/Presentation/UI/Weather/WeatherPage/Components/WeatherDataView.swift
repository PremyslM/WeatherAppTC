//
//  WeatherDataView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct WeatherDataView: View {
    let onSearchBtnClick: () -> Void
    let presenter: WeatherLocationListPresenter
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.onSearchBtnClick()
                    } label: {
                        VStack {
                            Text(presenter.selectedLocName)
                                .fontWeight(.semibold)
                            Text(presenter.selectedLocation?.country.localizedName ?? "Unknown")
                                .font(.footnote)
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .font(.system(size: 24))
                    }
                    Spacer()
                    Image(systemName: "link")
                }
                
                Image(systemName: "cloud.fill")
                    .renderingMode(.original)
                    .resizable()
                    .symbolEffect(.bounce, options: .repeating, value: false)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                VStack {
                    HStack(alignment: .top) {
                        Text(presenter.metricTemperatureString)
                            .font(.system(size: 64, weight: .bold))
                            .foregroundStyle(Color.white)
                    }
                    
                    Text(presenter.feelsLikeTempString)
                        .font(.footnote)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    Text(presenter.weatherTextString) // for example: cloudy
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                    
                    Rectangle()
                        .fill(.white.opacity(0.6))
                        .frame(height: 1)
                        .padding(.top, 50)
                    
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
            .padding(.horizontal)
            
            if presenter.isLoading {
                ZStack {
                    Color.black
                    VStack {
                        Text("Is loading")
                            .foregroundStyle(.white)
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 100)
            }
        }
        .safeAreaPadding(.vertical, 40)
    }
}
