//
//  Weather.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
