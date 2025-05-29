# Weather-App-In-Swift
This is a Weather App created using Swift/SwiftUI on XCode.

Description Of Project:

This project is a Weather App that finds the weather information of a city from a list of 100+ cities. The user selects which city they wish to check the weather of from that list and it displays a forecast of the expected temperature and conditions in the coming days. In this new screen, it also shows the user the current temperature of the city, the timezone and local time of the city, high and low temperatures of both the current day and in the forecast, adjusts the background on whether it is day or night in the selected city, and other relevant weather details. This weather information is extracted from a source of raw JSON data that comes from a third-party API (credited below) which is correctly parsed to ensure the appropriate information is shown for any city. From there, the data is then organized and displayed separately from each other for the user to understand the different weather information that is being shown to them on screen.

Credit For API Source: WeatherAPI
Powered by <a href="https://www.weatherapi.com/" title="Weather API">WeatherAPI.com</a>

Purpose & Goals Of This Project:

The purpose of this project is to provide users with basic weather information in a particular location they are interested in and help make it easy for them to perceive it. Additionally, this project aims to display detailed weather information and statistics in a way that can be easily accessible and comprehensible to the user. There are many goals that this project aims to achieve such as improving the user interface and making the app much more understandable to the user. This app also aims to find the weather information of the user's location when the user allows access for the app to use their location.

I plan to continue developing this project by implementing these features and improving the overall functionality of this app. Updates and changes made to the app will be documeneted in the committed changes of this repository.

Key Learnings:

I came across numerous roadblocks and challenges when I was developing this project such as API parsing, implementing and handling JSON data from the API source, and using SwiftUI to organize and structure the app functionality well. When attempting to parse the API, I came across many issues in trying to properly parse the raw JSON data due to the complexity of data that is being given out by the API response. To better understand the structure of the JSON data, I used XCode's Playground feature to help me analyze and extract the data one record at a time. From there, I experimented with different formats of code to determine the best approach with parsing and extracting the data correctly. In this approach, I was able to specifically find which code will help me with parsing and outputting the neccessary data that was needed for this project. When attempting to display this raw data, I went through issues in trying to implement the data onto the screen due to XCode's security protocols, which prevented the API response from being authorized. To resolve this, I looked into and investigated XCode's security settings to discern which setting was causing the issue. During my search, I discovered that the issue stemmed from the info.plist file, which contains essential configuration data for my application and noticed that some of this data needed to be changed in order for the requests made by the API to be authorized. From there, I configured the file and changed the appropriate data to grant full access to the API that I was using and was able to utlize the raw JSON data as much as possible.



Installation: (Not Fixed Yet Due To XCode's Security Updates)

For this project, I used XCode to implement this project and managed with many of it's security protocols in order to utilize the API source properly. Listed below are the steps on how to implement this application.

1. Install XCode and create a new project.
2. Install the files into the project. Alternatively, you can copy the code from the files and name them the way they are shown in this repository.
