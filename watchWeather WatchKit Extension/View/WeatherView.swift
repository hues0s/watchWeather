//
//  WeatherView.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        weatherViewModel = WeatherViewModel()
    }
    
    var body: some View {
        VStack {
            Text(weatherViewModel.city)
                .font(.system(size: 20))
                .padding([.leading, .trailing], 10)
                .padding(.top)
            
            Text(weatherViewModel.temperature)
                .font(.system(size: 45))
            
            Text(Constant.weatherIconMap[weatherViewModel.weatherIcon] ?? "")
                .font(.system(size: 30))
                .padding()
            
            Text(weatherViewModel.weatherDescription)
                .font(.system(size: 13))
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
