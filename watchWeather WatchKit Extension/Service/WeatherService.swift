//
//  WeatherService.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String) async -> Weather? {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(SecretConstants.OpenWeatherMapKey)"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse.main
        } catch {
            return nil
        }
    }
    
}
