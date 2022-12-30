//
//  WeatherService.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation
import CoreLocation

class WeatherService {
 
    func getWeather(coordinates: CLLocationCoordinate2D) async -> Weather? {
        guard let url = URL(string: "\(Constant.OpenWeatherMapApiString)&lat=\(coordinates.latitude)&lon=\(coordinates.longitude)") else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(APIResponse.self, from: data)
            return Weather(response: response)
        } catch {
            return nil
        }
    }
    
}
