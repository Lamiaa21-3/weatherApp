import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherState;

  WeatherModel(
      {required this.date,
        required this.temp,
        required this.minTemp,
        required this.maxTemp,
        required this.weatherState});

  factory WeatherModel.fromJson(Map<String , dynamic> map) {
    var jsonData = map['forecast']['forecastday'][0]['day'];


    return WeatherModel(
        date: map['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherState: jsonData['condition']['text'],
    );
  }
  String getImage() {
    if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
      return 'assets/clear.png';
    } else if (

    weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow') {
      return 'assets/clear.png';
    } else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog') {
      return 'assets/cloudy.png';
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers	') {
      return 'assets/rainy.png';
    } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState == 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
      return 'assets/thunderstorm.png';
    } else {
      return 'assets/snow.png';
    }
  }
  MaterialColor getThemeColor() {
    if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
      return Colors.orange;
    } else if (

    weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers	') {
      return Colors.blue;
    } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState == 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
//    return ' temp = $temp minTemp $minTemp maxTemp $maxTemp date $date';
}
