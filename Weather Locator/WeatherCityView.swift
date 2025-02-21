//
//  WeatherCityView.swift
//  FinalProject
//
//  Created by Tahsin Ahmed  on 4/16/24.
//
// Credit For API: WeatherAPI
// Powered by <a href="https://www.weatherapi.com/" title="Weather API">WeatherAPI.com</a>


import SwiftUI

// Information Regarding Astrology For Current Day
struct astroDetail: Decodable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moon_phase: String
    let moon_illumination: Int
}

// Information Of Weather For Each Day In Forecast
struct dayDetail: Decodable {
    let maxtemp_c: Double
    let maxtemp_f: Double
    let mintemp_c: Double
    let mintemp_f: Double
    let avgtemp_c: Double
    let avgtemp_f: Double
    let maxwind_mph: Double
    let maxwind_kph: Double
    let totalprecip_mm: Double
    let totalprecip_in: Double
    let totalsnow_cm: Double
    let avgvis_km: Double
    let avghumidity: Double
    let daily_chance_of_rain: Int
    let daily_chance_of_snow: Int
    let condition: conditionText // Refers To Line 43
    let uv: Double
}

// Pictures Used To Display Weather On A Day In Forecast
struct conditionText: Decodable {
    let text: String
    let icon: String
    let code: Int32
}

// Forecast Information
struct forecastArray: Decodable {
    let date: String
    let day: dayDetail // Refers To Line 22
    let astro: astroDetail // Refers To Line 12
}

// Specific Details On Weather Condition On A Day In Forecast
struct conditionDetail: Decodable {
    let text: String
    let icon: String
    let code: Int
}

// Information For Every Day In The Forecast
struct forecastDetail: Decodable {
    let forecastday: [forecastArray] // Array To Store Info Of Every Day In Forecast (Refers To Line 52 - 56)
}

// Weather Information On Current Day
struct currentDetail: Decodable {
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: conditionDetail
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Double
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Double
    let cloud:Double
    let feelslike_c: Double
    let feelslike_f: Double
    let vis_km: Double
    let vis_miles: Double
    let uv: Double
    let gust_mph:Double
    let gust_kph: Double
}

// Geographical Information Regarding City
struct locationDetail: Decodable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int64
    let localtime: String
}

// Entire Weather & Geographical Information Of The City
struct locationCity: Decodable {
    let location: locationDetail // Refers To Lines 97 - 106
    let current:  currentDetail // Refers To Lines 71- 94
    let forecast: forecastDetail // Refers To Lines 66 - 68
}

// Sets A List To Organize Information In Forecast
struct ListWeather: Identifiable {
    var id = UUID()
    var date: String
    var condition: String
    var highTemp: Double
    var lowTemp: Double
}

struct WeatherCityView: View {
    
    // City Variables
    var city: ListItem
    @State var forecasts: [ListWeather] = []
    
    // Location Variables
    @State var placeName = ""
    @State var placeRegion = ""
    @State var placeCountry = ""
    @State var timezone = ""
    @State var localtime = ""
    
    // Current Variables
    @State var lastUpdate = ""
    @State var tempf = 0.0
    @State var isDay = 0
    @State var windMPH = 0.0
    @State var windKPH = 0.0
    @State var windDegree = 0.0
    @State var windDirection = ""
    @State var pressureInch = 0.0
    @State var precipInch = 0.0
    @State var humidity = 0.0
    @State var cloud = 0.0
    @State var feelslikeF = 0.0
    @State var visibility = 0.0
    @State var uvIndex = 0.0
    @State var gustMPH = 0.0
    
    // Condition Variables
    @State var conditionText = ""
    @State var conditionImage = ""
    @State var conditionCode = 0
    
    // Forecast Variables (Lines 158 - 214)
    @State var forecastDate1 = ""
    @State var forecastDayMaxTempF = 0.0
    @State var forecastDayMinTempF = 0.0
    @State var forecastDayAvgTempF = 0.0
    @State var forecastDayMaxwindMPH = 0.0
    @State var forecastDayMaxwindKPH = 0.0
    @State var forecastDayTotalPrecip = 0.0
    @State var forecastDayTotalSnow = 0.0
    @State var forecastDayChanceOfRain = 0
    @State var forecastDayChanceOfSnow = 0
    @State var forecastDayConditionText = ""
    @State var forecastDayConditionImage = ""
    @State var forecastDayConditionCode = 0
    
    @State var forecastDaySunrise = ""
    @State var forecastDaySunset = ""
    @State var forecastDayMoonrise = ""
    @State var forecastDayMoonset = ""
    @State var forecastDayMoonPhase = ""
    @State var forecastDayMoonIllumination = 0
    
    
    @State var forecastDate2 = ""
    @State var forecastDate2MaxTempF = 0.0
    @State var forecastDate2MinTempF = 0.0
    @State var forecastDate2ConditionText = ""
    @State var forecastDate2ConditionCode = 0
    
    @State var forecastDate3 = ""
    @State var forecastDate3MaxTempF = 0.0
    @State var forecastDate3MinTempF = 0.0
    @State var forecastDate3ConditionText = ""
    @State var forecastDate3ConditionCode = 0
    
    @State var forecastDate4 = ""
    @State var forecastDate4MaxTempF = 0.0
    @State var forecastDate4MinTempF = 0.0
    @State var forecastDate4ConditionText = ""
    @State var forecastDate4ConditionCode = 0
    
    @State var forecastDate5 = ""
    @State var forecastDate5MaxTempF = 0.0
    @State var forecastDate5MinTempF = 0.0
    @State var forecastDate5ConditionText = ""
    @State var forecastDate5ConditionCode = 0
    
    @State var forecastDate6 = ""
    @State var forecastDate6MaxTempF = 0.0
    @State var forecastDate6MinTempF = 0.0
    @State var forecastDate6ConditionText = ""
    @State var forecastDate6ConditionCode = 0
    
    @State var forecastDate7 = ""
    @State var forecastDate7MaxTempF = 0.0
    @State var forecastDate7MinTempF = 0.0
    @State var forecastDate7ConditionText = ""
    @State var forecastDate7ConditionCode = 0
    
    
    var body: some View {
        
            ZStack {
                
                // Background Changes Depending On Time Of The City
                if (isDay == 1)
                {
                    Image("Day Image")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
                else
                {
                    Image("Night Image 3")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
                
                VStack {
                    
                    // Displays Name Of City & Country
                    Text(city.title)
                        .font(.title)
                        .foregroundStyle(.white)
                    
                    Text(city.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    // Organizes Current Information Of The City (Timezone, Current Time In City, High & Low Temps In The Current Day, Current Temp & Weather Condition In City)
                    VStack(spacing: 0) {
                        HStack {
                            Text("TZ: \(timezone)")
                            //.position(x: 200, y: 50)
                                .offset(x: -40, y: 30)
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                            
                            Text("Time: \(localtime)")
                                .offset(x: 40, y: 30)
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                        } // End HStack
                        
                        Text(String(tempf) + "°F")
                            .bold()
                            .position(x: 200, y: 100)
                        //.frame(width: 80, height: 150)
                            .font(.system(size: 40))
                            .offset(y: -40)
                            .foregroundStyle(.white)
                        
                        Text(conditionText)
                            .offset(y: 40)
                            .foregroundStyle(.white)
                        
                        HStack {
                            Text("High: " + String(forecastDayMaxTempF) + "°F")
                                .position(x: 200, y: 100)
                                .offset(x: -100, y: -100)
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                            
                            Text("Low: " + String(forecastDayMinTempF) + "°F")
                                .position(x: 200, y: 100)
                                .offset(x: -100, y: -100)
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                            
                        } // End HStack
                        
                        // Creates 7-Day Forecast & Organizes Info For Each Day
                        Text("7-Day Forecast")
                            .bold()
                            .foregroundStyle(.white)
                        
                        List(forecasts) { forecast in
                            HStack {
                                Text("\(forecast.date)")
                                Text("\(forecast.condition)")
                                Text(" H: " + String(forecast.highTemp) + "°F")
                                Text(" L:" + String(forecast.lowTemp) + "°F")
                            } // End Of HStack
                        } // End Of List
                        .frame(height: 300)
                        .border(Color.black)
                    } // End Of VStack
                    
                    // Additional Weather Information On Current Day
                    HStack {
                        
                        Text("Wind:" + "\n" + String(windMPH) + " MPH\n" + "\(windDirection)")
                            .padding()
                            .background(.gray)
                            .foregroundStyle(.white)
                        
                        Text("Feels Like: " + String(feelslikeF) + "°F")
                            .padding()
                            .background(.gray)
                            .foregroundStyle(.white)
                        
                        if (conditionText == "Sunny" || conditionText == "Clear")
                        {
                            Text("Visibility:" + "\n" + String(visibility) + " %")
                                .padding()
                                .background(.gray)
                                .foregroundStyle(.white)
                        }
                        else
                        {
                            Text("Chance Of Rain: " + String(forecastDayChanceOfRain) + " %")
                                .padding()
                                .background(.gray)
                                .foregroundStyle(.white)
                        }
                    } // End Of HStack
                }
                
                Spacer()
        } // End Of VStack (Line 231)
        .task {
            await fetchWeatherCityData(city: city.title)
        }
    } // End Body
    
    // Passes In Name Of City As A String Into The Function
    func fetchWeatherCityData(city: String) async {
        
        // Create The URL For API
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=4c0e66c9ac2849e392f21507251702&q=\(city)&days=7")
            
        else
        {
            print("THIS URL DOES NOT WORK!")
            return
        }
        
        // Fetch Raw JSON Data From API
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode & Parse That Data
            if let decodedResponse = try? JSONDecoder().decode(locationCity.self, from: data)
            {
                // Location Variables
                placeName = decodedResponse.location.name
                placeRegion = decodedResponse.location.region
                placeCountry = decodedResponse.location.country
                timezone = decodedResponse.location.tz_id
                localtime = decodedResponse.location.localtime
                
                // Current Variables
                lastUpdate = decodedResponse.current.last_updated
                tempf = decodedResponse.current.temp_f
                isDay = decodedResponse.current.is_day
                windMPH = decodedResponse.current.wind_mph
                windKPH = decodedResponse.current.wind_kph
                windDegree = decodedResponse.current.wind_degree
                windDirection = decodedResponse.current.wind_dir
                pressureInch = decodedResponse.current.pressure_in
                precipInch = decodedResponse.current.precip_in
                humidity = decodedResponse.current.humidity
                cloud = decodedResponse.current.cloud
                feelslikeF = decodedResponse.current.feelslike_f
                visibility = decodedResponse.current.vis_miles
                uvIndex = decodedResponse.current.uv
                gustMPH = decodedResponse.current.gust_mph
                
                // Condition Variables
                conditionText = decodedResponse.current.condition.text
                conditionImage = decodedResponse.current.condition.icon
                conditionCode = decodedResponse.current.condition.code
                
                // Forecast Variables
                // Created For-Loop To Store & Set Information For Each Day In Forecast
                for index in 0...0 {
                    
                    forecastDate1 = decodedResponse.forecast.forecastday[index].date
                    forecastDate1 = String(forecastDate1.dropFirst(5))
                    forecastDayMaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDayMinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDayAvgTempF = decodedResponse.forecast.forecastday[index].day.avgtemp_f
                    forecastDayMaxwindMPH = decodedResponse.forecast.forecastday[index].day.maxwind_mph
                    forecastDayMaxwindKPH = decodedResponse.forecast.forecastday[index].day.maxwind_kph
                    forecastDayTotalPrecip = decodedResponse.forecast.forecastday[index].day.totalprecip_in
                    forecastDayTotalSnow = decodedResponse.forecast.forecastday[index].day.totalsnow_cm
                    forecastDayChanceOfRain = decodedResponse.forecast.forecastday[index].day.daily_chance_of_rain
                    forecastDayChanceOfSnow = decodedResponse.forecast.forecastday[index].day.daily_chance_of_snow
                    forecastDayConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDayConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                    
                    forecastDaySunrise = decodedResponse.forecast.forecastday[index].astro.sunrise
                    forecastDaySunset = decodedResponse.forecast.forecastday[index].astro.sunset
                    forecastDayMoonrise = decodedResponse.forecast.forecastday[index].astro.moonrise
                    forecastDayMoonset = decodedResponse.forecast.forecastday[index].astro.moonset
                    forecastDayMoonPhase = decodedResponse.forecast.forecastday[index].astro.moon_phase
                    forecastDayMoonIllumination = decodedResponse.forecast.forecastday[index].astro.moon_illumination
                }
                
                for index in 0...1 {
                    
                    forecastDate2 = decodedResponse.forecast.forecastday[index].date
                    forecastDate2 = String(forecastDate2.dropFirst(5))
                    forecastDate2MaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDate2MinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDate2ConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDate2ConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                }
                
                for index in 0...2 {
                    
                    forecastDate3 = decodedResponse.forecast.forecastday[index].date
                    forecastDate3 = String(forecastDate3.dropFirst(5))
                    forecastDate3MaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDate3MinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDate3ConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDate3ConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                }
                
                /*
                for index in 0...3 {
                    
                    forecastDate4 = decodedResponse.forecast.forecastday[index].date
                    forecastDate4 = String(forecastDate4.dropFirst(5))
                    forecastDate4MaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDate4MinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDate4ConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDate4ConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                }
                
                for index in 0...4 {
                    
                    forecastDate5 = decodedResponse.forecast.forecastday[index].date
                    forecastDate5 = String(forecastDate5.dropFirst(5))
                    forecastDate5MaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDate5MinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDate5ConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDate5ConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                }
                
                for index in 0...5 {
                    
                    forecastDate6 = decodedResponse.forecast.forecastday[index].date
                    forecastDate6 = String(forecastDate6.dropFirst(5))
                    forecastDate6MaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDate6MinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDate6ConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDate6ConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                }
                
                for index in 0...6 {
                    
                    forecastDate7 = decodedResponse.forecast.forecastday[index].date
                    forecastDate7 = String(forecastDate7.dropFirst(5))
                    forecastDate7MaxTempF = decodedResponse.forecast.forecastday[index].day.maxtemp_f
                    forecastDate7MinTempF = decodedResponse.forecast.forecastday[index].day.mintemp_f
                    forecastDate7ConditionText = decodedResponse.forecast.forecastday[index].day.condition.text
                    forecastDate7ConditionCode = Int(decodedResponse.forecast.forecastday[index].day.condition.code)
                }
                */
                
                // Created Variable To Store List Of Information For The 7-Day Forecast
                // This Information Is Extracted From API Response
                let temps = [
                    ListWeather(date: forecastDate1, condition: forecastDayConditionText, highTemp: forecastDayMaxTempF, lowTemp: forecastDayMinTempF),
                    ListWeather(date: forecastDate2, condition: forecastDate2ConditionText, highTemp: forecastDate2MaxTempF, lowTemp: forecastDate2MinTempF),
                    ListWeather(date: forecastDate3, condition: forecastDate3ConditionText, highTemp: forecastDate3MaxTempF, lowTemp: forecastDate3MinTempF),
                    ListWeather(date: forecastDate4, condition: forecastDate4ConditionText, highTemp: forecastDate4MaxTempF, lowTemp: forecastDate4MinTempF),
                    ListWeather(date: forecastDate5, condition: forecastDate5ConditionText, highTemp: forecastDate5MaxTempF, lowTemp: forecastDate5MinTempF),
                    ListWeather(date: forecastDate6, condition: forecastDate6ConditionText, highTemp: forecastDate6MaxTempF, lowTemp: forecastDate6MinTempF),
                    ListWeather(date: forecastDate7, condition: forecastDate7ConditionText, highTemp: forecastDate7MaxTempF, lowTemp: forecastDate7MinTempF),
                ]
                
                forecasts = temps
            }
        } catch {
            print("THIS DATA IS NOT VALID!")
        }
        // ecode the data
    }
}

// End of View
struct WeatherCityView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WeatherCityView(city: cities[0])
    }
}
