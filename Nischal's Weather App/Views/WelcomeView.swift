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
                                .foregroundColor(Color(hue: 0.559, saturation: 0.203, brightness: 0.882, opacity: 0.354))
                                .cornerRadius(12.0)
                                .blur(radius: 1.0)
                                .shadow(color: Color.gray, radius: 3, x: 2, y: 2)
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
        
         /*ZStack{
             GeometryReader { geometry in
                             Rectangle()
                                 .foregroundColor(Color(hue: 0.559, saturation: 0.203, brightness: 0.882, opacity: 0.354))
                                 .cornerRadius(18.0)
                                 .blur(radius: 1.0)
                                 .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                                 .padding()
                                 .frame(width: geometry.size.width, height: geometry.size.height) // Set width and height relative to the VStack

                         }
            VStack {
               Spacer() // Pushes VStack to the center vertically
                VStack {
                            Text("Mausam Kasto Cha?")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                            
                            Text("Please share your current location to get the weather in your area.")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
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
          */
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
