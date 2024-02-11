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
    
    @State private var linkButtonClicked: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        self.onSearchBtnClick()
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(presenter.selectedLocName)
                                    .fontWeight(.semibold)
                                Image(systemName: "location.magnifyingglass")
                            }
                            Text(presenter.locationLocName) // TODO: Add into presenter "Country"
                                .font(.footnote)
                        }
                        .padding()
                        .font(.system(size: 18))
                    }
                    Spacer()
                    Image(systemName: "link")
                        .onTapGesture {
                            self.linkButtonClicked.toggle()
                        }
                        .sheet(isPresented: $linkButtonClicked, content: {
                            WebView(url: presenter.weatherURLLinkString)
                        })
                }
                .foregroundStyle(.white)
                
                Image(systemName: presenter.weatherSystemImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
                    .foregroundStyle(.white)
                
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
            .padding(.top, 50)
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
        .safeAreaPadding(.vertical, 80)
    }
}
