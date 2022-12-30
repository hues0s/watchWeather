//
//  Weather.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}

struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init() {
        city = ""
        temperature = ""
        description = ""
        iconName = ""
    }
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description.capitalized ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
