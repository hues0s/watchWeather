//
//  WeatherService.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(SecretConstants.OpenWeatherMapKey)"
        
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let data = data, error == nil {
                    let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                    if let weatherResponse = weatherResponse {
                        let weather = weatherResponse.main
                        completion(weather)
                    } else {
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
                
            }.resume()
            
        } else {
            completion(nil)
        }
        
    }
    
}
