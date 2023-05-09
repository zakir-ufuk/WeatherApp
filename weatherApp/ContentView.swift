//
//  ContentView.swift
//  weatherApp
//
//  Created by Zakir Ufuk Sahiner on 24.04.23.
//

import SwiftUI

//the app UI
struct ContentView: View {
    
    @State private var isNight = false // to check if dark mode is enabled
    
    
    
    var body: some View {
        ZStack {
            // changing the background color depending on dark mode
            BackgroundView(isNight: $isNight)
            // Vstack for current weather in the location
            VStack() {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView (imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                // forecast section
                HStack(spacing: 8) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 50)
                }
                Spacer()
                
                // What happens when the Button is pressed
                Button {
                    isNight.toggle()
                } label: { // the UI of the button
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    // Struct for daily weather forecast ( the weather/day etc this allows the dayOfWeek, imageName, temperature to be changed/ updated easily)
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40
                )
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
// Struct for background ( So that the background can be changed in dark mode ( ** In the future I can also change the background depending on the weather (sunny, snowy, rainy + dark mode)

struct BackgroundView: View {
    @Binding var isNight: Bool
    
//changin the background and symbol colors depending on dark mode
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
                       }
                       }
// Struct for cityName on top
struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String // to get the right image from SF Symbols
    var temperature: Int // Temperature displayed
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180
                )
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
