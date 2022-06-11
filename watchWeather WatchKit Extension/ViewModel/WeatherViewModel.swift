//
//  WeatherViewModel.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weather = Weather()
    
    var temperature: String {
        if let temp = weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    init(city: String) {
        fetchWeather(city: city)
    }
    
    func fetchWeather(city: String) {
        WeatherService().getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
    
}
