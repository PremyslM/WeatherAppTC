//
//  NavSearchButtonView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 08.02.2024.
//

import SwiftUI


struct NavSearchButtonView: View {
    let onClickAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 10) {
                Text("Search for location")
                Image(systemName: "location.magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
            }
            .foregroundStyle(.blue)
            .font(.system(size: 20, weight: .semibold))
        }
        .frame(width: 250, height: 150)
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
        .shadow(color: .blue, radius: 10)
        .onTapGesture {
            onClickAction()
            print("Tapped")
        }
    }
}

#Preview {
    NavSearchButtonView(onClickAction: {
        print("Click")
    })
}
