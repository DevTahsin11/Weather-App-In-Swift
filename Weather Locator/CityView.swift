//
//  WeatherCityView.swift
//  FinalProject
//
//  Created by Tahsin Ahmed  on 4/9/24.
//
import SwiftUI
struct CityView: View {
    var body: some View {
            
            List (cities) {city in
                NavigationLink(destination: WeatherCityView (city: city)) // City Gets Passed As Parameter For Next Screen
                {
                    HStack {
                        VStack (alignment: .leading, spacing: 10)
                        {
                            Text("\(city.title)")
                                .font(.system(size: 30, weight: .bold))
                            
                            Text("\(city.subtitle)")
                        } // end VStack
                            
                        Spacer()
                    }
                } // end HStack
                
            } // end List
            .navigationBarTitle("World Cities")
    }
}
struct CityView_Previews: PreviewProvider {
    static var previews: some View
    {
        CityView()
    }
}
struct ListItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

// List of 100+ Cities
var cities = [
    ListItem(title: "Paris",   subtitle: "France"),
    ListItem(title: "Dubai",   subtitle: "United Arab Emirates"),
    ListItem(title: "Madrid",  subtitle: "Spain"),
    ListItem(title: "Tokyo",   subtitle: "Japan"),
    ListItem(title: "Amsterdam",   subtitle: "The Netherlands"),
    ListItem(title: "Berlin",   subtitle: "Germany"),
    ListItem(title: "Rome",    subtitle: "Italy"),
    ListItem(title: "New York",   subtitle: "United States"),
    ListItem(title: "Barcelona",    subtitle: "Spain"),
    ListItem(title: "London",     subtitle: "United Kingdom"), // 10 Cities
    ListItem(title: "Istanbul",     subtitle: "Turkey"),
    ListItem(title: "Lisbon",     subtitle: "Portugal"),
    ListItem(title: "Chicago",     subtitle: "United States"),
    ListItem(title: "Singapore",     subtitle: "Singapore"),
    ListItem(title: "Seoul",     subtitle: "South Korea"),
    ListItem(title: "Bangkok",     subtitle: "Thailand"),
    ListItem(title: "Shanghai",     subtitle: "China"),
    ListItem(title: "Los Angeles",     subtitle: "United States"),
    ListItem(title: "Sydney",     subtitle: "Australia"),
    ListItem(title: "Berlin",     subtitle: "Germany"), // 20 Cities
    ListItem(title: "Moscow",     subtitle: "Russia"),
    ListItem(title: "Mumbai",     subtitle: "India"),
    ListItem(title: "Toronto",     subtitle: "Canada"),
    ListItem(title: "Rio de Janeiro",     subtitle: "Brazil"),
    ListItem(title: "Cairo",     subtitle: "Egypt"),
    ListItem(title: "Mexico City",     subtitle: "Mexico"),
    ListItem(title: "Las Vegas",     subtitle: "United States"),
    ListItem(title: "Miami",     subtitle: "United States"),
    ListItem(title: "Cape Town",     subtitle: "South Africa"),
    ListItem(title: "Prague",     subtitle: "Czech Republic"), // 30 Cities
    ListItem(title: "Dublin",     subtitle: "Ireland"),
    ListItem(title: "Vienna",     subtitle: "Austria"),
    ListItem(title: "Stockholm",     subtitle: "Sweden"),
    ListItem(title: "Copenhagen",     subtitle: "Denmark"),
    ListItem(title: "Warsaw",     subtitle: "Poland"),
    ListItem(title: "Athens",     subtitle: "Greece"),
    ListItem(title: "Oslo",     subtitle: "Norway"),
    ListItem(title: "Helsinki",     subtitle: "Finland"),
    ListItem(title: "Melbourne",     subtitle: "Australia"),
    ListItem(title: "Osaka",     subtitle: "Japan"), // 40 Cities
    ListItem(title: "Calais",     subtitle: "France"),
    ListItem(title: "Nice",     subtitle: "France"),
    ListItem(title: "Milan",     subtitle: "Italy"),
    ListItem(title: "Brussels",     subtitle: "Belgium"),
    ListItem(title: "Munich",     subtitle: "Germany"),
    ListItem(title: "Nairobi",     subtitle: "Kenya"),
    ListItem(title: "Alexandria",     subtitle: "Egypt"),
    ListItem(title: "Johannesburg",     subtitle: "South Africa"),
    ListItem(title: "Casablanca",     subtitle: "Morocco"),
    ListItem(title: "Makkah",     subtitle: "Saudi Arabia"),
    ListItem(title: "Madinah",     subtitle: "Saudi Arabia"), // 50 Cities
    ListItem(title: "Florence",     subtitle: "Italy"),
    ListItem(title: "Nizhny Novgorod Oblast",     subtitle: "Russia"),
    ListItem(title: "Petropavlovsk-Kamchatskiy",     subtitle: "Russia"),
    ListItem(title: "Fairbanks",     subtitle: "US (Alaska)"),
    ListItem(title: "Montreal",     subtitle: "Canada"),
    ListItem(title: "Ashgabat",     subtitle: "Turkmenistan"),
    ListItem(title: "Sylhet",     subtitle: "Bangladesh"),
    ListItem(title: "Boulder Creek",     subtitle: "US (California)"),
    ListItem(title: "Baghdad",     subtitle: "Iraq"),
    ListItem(title: "N'Djamena",     subtitle: "Chad"), // 60 Cities
    ListItem(title: "Manchester", subtitle: "United Kingdom"),
    ListItem(title: "Vancouver", subtitle: "Canada (B.C.)"),
    ListItem(title: "Ottawa", subtitle: "Canada"),
    ListItem(title: "Zagreb", subtitle: "Croatia"),
    ListItem(title: "Sofia", subtitle: "Bulgaria"),
    ListItem(title: "Kyiv", subtitle: "Ukraine"),
    ListItem(title: "Kabul", subtitle: "Afghanistan"),
    ListItem(title: "Tehran", subtitle: "Iran"),
    ListItem(title: "Canberra", subtitle: "Australia"),
    ListItem(title: "Wellington", subtitle: "New Zealand"), // 70 Cities
    ListItem(title: "Sao Paulo", subtitle: "Brazil"),
    ListItem(title: "Lima", subtitle: "Peru"),
    ListItem(title: "Bogota", subtitle: "Columbia"),
    ListItem(title: "Santiago", subtitle: "Chile"),
    ListItem(title: "Caracas", subtitle: "Venezuela"),
    ListItem(title: "Buenos Aires", subtitle: "Argentina"),
    ListItem(title: "La Paz", subtitle: "Bolivia"),
    ListItem(title: "Montevideo", subtitle: "Uruguay"),
    ListItem(title: "Paramaribo", subtitle: "Suriname"),
    ListItem(title: "Cayenne", subtitle: "French Guiana"), // 80 Cities
    ListItem(title: "Tijuana", subtitle: "Mexico"),
    ListItem(title: "Jakarta", subtitle: "Indonesia"),
    ListItem(title: "Brisbane", subtitle: "Australia"),
    ListItem(title: "Geneva", subtitle: "Switzerland"),
    ListItem(title: "Doha", subtitle: "Qatar"),
    ListItem(title: "Venice", subtitle: "Italy"),
    ListItem(title: "Hanoi", subtitle: "Vietnam"),
    ListItem(title: "Kuala Lumpur", subtitle: "Malaysia"),
    ListItem(title: "Taipei", subtitle: "Taiwan"),
    ListItem(title: "Houston", subtitle: "United States"), // 90 Cities
    ListItem(title: "Beijing", subtitle: "China"),
    ListItem(title: "Boston", subtitle: "United States"),
    ListItem(title: "Budapest", subtitle: "Hungary"),
    ListItem(title: "Frankfurt", subtitle: "Germany"),
    ListItem(title: "Marseille", subtitle: "France"),
    ListItem(title: "Naples", subtitle: "Italy"),
    ListItem(title: "Pune", subtitle: "India"),
    ListItem(title: "Karachi", subtitle: "Pakistan"),
    ListItem(title: "Lahore", subtitle: "Pakistan"),
    ListItem(title: "Ho Chi Minh City", subtitle: "Vietnam"), // 100 Cities
    ListItem(title: "Muscat", subtitle: "Oman"),
    ListItem(title: "Beirut", subtitle: "Lebanon"),
    ListItem(title: "Lagos", subtitle: "Nigeria"),
    ListItem(title: "Tunis", subtitle: "Tunisia"),
]
