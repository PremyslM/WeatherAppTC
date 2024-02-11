//
//  WeatherPresenter.swift
//  WeatherAppTC
//
//  Created by Přemysl Mikulenka on 11.02.2024.
//

import Foundation

class WeatherPresenter: ObservableObject {
    @Published private var weatherList: Weather?
    @Published var isLoading: Bool = true
    
    private let weatherIconProvider = WeatherIconProvider()
    private let weatherInteractor: WeatherInteractor
    
    init(_ weatherInteractor: WeatherInteractor) {
        self.weatherInteractor = weatherInteractor
    }
    
    var metricTemperatureString: String {
        guard let value = weatherList?.temperature.metric.value else { return "unknown" }
        return "\(Int(value.rounded()))°"
    }
    
    var weatherTextString: String {
        weatherList?.weatherText ?? "unknown"
    }
    
    var windSpeedString: String {
        guard let value = weatherList?.wind?.speed.metric.value else { return "unknown" }
        return "\(Int(value.rounded())) m/s"
    }
    
    var pressureString: String {
        guard let value = weatherList?.pressure.metric.value else { return "unknown" }
        return "\(Int(value)) kPal"
    }
    
    var uvIndexString: String {
        return "\(String(describing: weatherList?.uvIndex))"
    }
    
    var feelsLikeTempString: String {
        guard let value = weatherList?.apparentTemperature.metric.value else { return "unknown" }
        return "Feels like \(Int(value))°C"
    }
    
    var weatherURLLinkString: String {
        weatherList?.urlLink ?? ""
    }
    
    var weatherSystemImage: String {
        guard let weatherIcon = weatherList?.weatherIcon else { return "" }
        return weatherIconProvider.getWeatherIcon(for: Int(weatherIcon))
    }
    
    var weatherDetailList: [WeatherDetailModel] {
        [
            WeatherDetailModel(label: "Wind", content: windSpeedString, systemImage: "wind"),
            WeatherDetailModel(label: "Pressure", content: pressureString, systemImage: "barometer"),
            WeatherDetailModel(label: "UV", content: uvIndexString, systemImage: "sun.max.fill")
        ]
    }
    
    func setWeather(_ location: Location) {
        weatherInteractor.setWeather(location) { [weak self] in
            guard let self = self, let weatherList = self.weatherInteractor.weatherList else { return }
            DispatchQueue.main.async {
                self.weatherList = weatherList
                self.isLoading = self.weatherInteractor.isLoading
            }
        }
    }
}
