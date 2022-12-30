//
//  WeatherViewModel.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    
    @Published var city: String = ""
    @Published var temperature: String = ""
    @Published var weatherDescription: String = ""
    @Published var weatherIcon: String = ""
    
    override init() {
        //fetchWeather()
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func fetchWeather(coordinates: CLLocationCoordinate2D) {
        Task {
            let weather = await WeatherService().getWeather(coordinates: coordinates)
            if let weather = weather {
                DispatchQueue.main.async {
                    self.city = weather.city
                    self.temperature = "\(weather.temperature)ºC"
                    self.weatherDescription = weather.description
                    self.weatherIcon = weather.iconName
                }
            }
        }
    }
    
}

extension WeatherViewModel: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        fetchWeather(coordinates: location.coordinate)
    }
}
