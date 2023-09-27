//
//  WelcomeView.swift
//  Nischal's Weather App
//
//  Created by Nischal Niroula on 19/7/2023.
//

import SwiftUI
import CoreLocationUI



struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        
        VStack {
            Spacer() // Pushes VStack to the center vertically
            
            VStack {
                Text("Mausam Kasto Cha?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 3)
                
                Text("Please share your current location to get the weather in your area.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)
                    .padding(.top, 3)
            }
            .padding()
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .foregroundColor(Color(red: 66 / 255, green: 127 / 255, blue: 146 / 255))
                        .cornerRadius(12.0)
                        .blur(radius: 0.4)
                        .opacity(0.8)
                    //.shadow(color: Color.gray, radius: 2, x: 2, y: 2)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            )
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(12)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .padding()
            
            
            Spacer() // Pushes VStack to the center vertically
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        Spacer()
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
