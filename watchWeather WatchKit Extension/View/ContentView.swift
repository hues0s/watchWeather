//
//  ContentView.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    
    let currentCountry: Country = Country(name: "Singapore", flag: "dollarsign.square")
    
    var body: some View {
        WeatherView(country: currentCountry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
