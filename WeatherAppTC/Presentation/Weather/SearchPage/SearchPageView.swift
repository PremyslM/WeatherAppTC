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
                    content: LocationList(locationList: locationDataSource.locations),
                    cornerRadius: .init(
                        topLeading: 35.0,
                        bottomLeading: 35.0,
                        bottomTrailing: 35.0,
                        topTrailing: 35.0
                    )
                )
                Spacer()
                
                CustomSearchBar(onSearchSubmit: locationDataSource.getLocation(cityName:))
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


struct CustomSearchBar: View {
    @State private var searchText: String = "Czech"
    @State private var isEditing: Bool = false
    
    let onSearchSubmit: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.white.opacity(0.5)))
                .cornerRadius(8)
                .onTapGesture {
                    self.isEditing = true
                }
                .onSubmit {
                    onSearchSubmit(searchText)
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                    
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .renderingMode(.original)
                }
                .padding(.horizontal, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct LocationList: View {
    let locationList: [Location]
    
    var body: some View {
        List {
            ForEach(locationList, id: \.localizedName) { location in
                HStack {
                    Text(location.localizedName)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text(location.country.localizedName)
                        .font(.footnote)
                }
                .foregroundStyle(.white)
            }
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .padding(.vertical)
    }
}
