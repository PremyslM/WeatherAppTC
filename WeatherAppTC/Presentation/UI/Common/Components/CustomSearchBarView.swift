//
//  CustomSearchBar.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 23.01.2024.
//

import SwiftUI

struct CustomSearchBarView: View {
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    let onSearchSubmit: (String) -> Void

    var body: some View {
        HStack {
            lazy var textField: some View = {
                TextField("Search ...", text: $searchText) {
                    onSearchSubmit(searchText)
                }
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.white.opacity(0.5)))
                .cornerRadius(8)
            }()

            textField
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .renderingMode(.original)
                        .padding(.horizontal, 10)
                }
                //.transition(.move(edge: .trailing))
            }
        }
    }
}

