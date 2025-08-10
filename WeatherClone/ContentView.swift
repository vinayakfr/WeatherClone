//
//  ContentView.swift
//  WeatherClone
//
//  Created by Vinayak Srivastava on 23/06/25.
//

import SwiftUI

struct ContentView: View {
    // What does state do?
    @State private var isNight = false
    
    var body: some View {
        // Using ZStack to align the stacks on the z-axis
        ZStack {
            BackgroundView(isNight: isNight)
            // Vertical stack
            VStack{
                CityTextView(cityName: "Delhi, India")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack (spacing: 30){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THUR", imageName: "wind", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "moon.stars.fill", temperature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    ButtonTextView(title: "Change Day Time",
                                   textColor: .blue,
                                   backgroundColor: .white)
                }
                
                    
            
                Spacer()
            }
          
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    // Passing in the parameters
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 10){
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    // What does binding do?
    var isNight: Bool

    
    var body: some View {
        // Using a ternary operator to change the background colour
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

// This is like a component
// This appears at the top of the screen, it shows the State, Country
struct CityTextView: View {
    // We pass in a parameter - cityName
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .frame(width: 200, height: 200)

    }
}

struct MainWeatherStatusView: View {
    // We are using two parameters over here -
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

