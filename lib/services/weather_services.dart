import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '14db4da6a9fb40bcb9d113303231809';

  Future<WeatherModel> getWeather({required String cityName}) async
  {

    Uri url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    Map<String, dynamic>data = jsonDecode(response.body);
   try{
     WeatherModel weather = WeatherModel.fromJson(data);
     print('Doneeeeeeeeeeee');
     return weather;
   }catch(e){
     print('erorrrrrrr');
     print(e);
     WeatherModel weather = WeatherModel.fromJson(data);
     return weather;
   }

  }
}