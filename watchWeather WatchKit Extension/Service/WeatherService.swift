//
//  WeatherService.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String) async -> Weather? {
        
        guard let url = URL(string: Constant.OpenWeatherMapApiString + city) else {
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
