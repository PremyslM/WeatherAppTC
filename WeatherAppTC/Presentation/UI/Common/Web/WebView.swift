//
//  WebView.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 08.02.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url:String
        
    func makeUIView(context: Context) -> some UIView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        return webview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
