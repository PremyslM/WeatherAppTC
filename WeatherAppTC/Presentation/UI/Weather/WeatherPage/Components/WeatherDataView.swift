//
//  WeatherDataView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct WeatherDataView: View {
    let onSearchBtnClick: () -> Void
    let temperature: [Temperature]?
    let locationPresenter: LocationListPresenter
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                self.onSearchBtnClick()
            } label: {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text(locationPresenter.selectedLocation?.localizedName ?? "Unknown")
                        .fontWeight(.semibold)
                }
                .padding()
                .foregroundStyle(.white)
                .font(.system(size: 24))
            }
            
            Image(systemName: "cloud.fill")
                .renderingMode(.original)
                .resizable()
                .symbolEffect(.bounce, options: .repeating, value: false)
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            
            VStack {
                HStack(alignment: .top) {
                    Text("16°") // in X°C
                        .font(.system(size: 64, weight: .bold))
                        .foregroundStyle(Color.white)
                }
                
                Text(temperature?.first?.weatherText ?? "Unknown") // for example: cloudy
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.white)
                
                Rectangle()
                    .fill(.white.opacity(0.6))
                    .frame(height: 1)
                    .padding(.top, 50)
                
                HStack(spacing: 40) {
                    ForEach(0..<3) {_ in
                        VStack {
                            Image(systemName: "wind")
                                .font(.system(size: 24))
                                .padding(.bottom, 1)
                            Text("13 km/s")
                                .font(.system(size: 18, weight: .medium))
                            Text("Wind")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.8))
                        }
                        .foregroundStyle(.white)
                    }
                }
                .padding(.vertical, 30)
            }
        }
        .padding(.horizontal)
        
    }
}
