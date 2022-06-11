//
//  WeatherView.swift
//  watchWeather WatchKit Extension
//
//  Created by Héctor Ullate on 11/6/22.
//

import SwiftUI

struct WeatherView: View {
    
    let country: Country
    
    var body: some View {
        VStack {
            HStack {
                Text("30ºC").font(.system(size: 30))
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Text(country.name).font(.system(size: 16))
                Spacer()
                Image(systemName: country.flag).resizable().frame(width: 60, height: 60)
            }
            
            HStack {
                NavigationLink(destination: CountryListView()) {
                    Text("Listing")
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(country: Country(name: "Singapore", flag: "dollarsign.square"))
    }
}
