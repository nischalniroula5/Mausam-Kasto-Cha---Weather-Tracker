//
//  ContentView.swift
//  Nischal's Weather App
//
//  Created by Nischal Niroula on 19/7/2023.
//

//App Icon To be added

import SwiftUI

struct ContentView: View {
    
    @State private var animateGradient = false
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
       
            VStack{
                if let location = locationManager.location{
                    if let weather = weather{
                        WeatherView(weather:weather)
                    }else{
                        LoadingView()
                            .task {
                                do{
                                    weather = try await weatherManager
                                        .getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                } catch{
                                    print("Error Getting Weather:\(error)")
                                }
                            }
                    }
                }else{
                    if locationManager.isLoading{
                        LoadingView()
                    } else {
                            WelcomeView().environmentObject(locationManager)
                        }
                    }
                
                
               	
            }
            .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .edgesIgnoringSafeArea(.all)
                            .hueRotation(.degrees(animateGradient ? 45 : 0))
                            .animation(Animation.linear(duration: 4).repeatForever(autoreverses: true), value: animateGradient) // Use animation(_:value:) instead
                            .onAppear {
                                withAnimation {
                                    animateGradient.toggle() // Use withAnimation block
                                }
                            }
                    )
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
