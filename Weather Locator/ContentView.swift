//
//  ContentView.swift
//  FinalProject
//
//  Created by Tahsin Ahmed  on 3/31/24.
//
import SwiftUI
struct ContentView: View {
    
    var body: some View {
            NavigationView {
                
                Button(action: {
                    
                }, label: {
                    
                    Image("skyPic")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        NavigationLink(destination: CityView())
                        {
                             Text("Select Weather From A City")
                                .font(.title3)
                                .foregroundStyle(.orange)
                                .border(.gray)
                                .background(.gray)
                                .shadow(radius: 20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20) // Overlay W/ Rounded Rectangle
                                        .stroke(Color.gray, lineWidth: 2) // Border Color & Width
                                )
                                .scaleEffect(1.5) // Scale Effect
                                .frame(width: 200, height: 50) // Button Size
                                .padding(.horizontal, 20)
                        }
                    }  // end vertical Stack
                    
                    // Plan To Have Another Button Here (Checks Weather Of User's Current Location)
                    
                    
                    .navigationTitle("City Weather Locator")
                    .offset(x: -220, y:-50)
                })
            } // end navigation view
    } // end body
}
#Preview {
    ContentView()
}
