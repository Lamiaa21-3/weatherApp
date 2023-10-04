

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherCubit extends Cubit <WeatherState>{

  WeatherCubit(this.weatherServices) : super(InitialWeatherState());
 WeatherServices weatherServices;
 WeatherModel? weatherModel;
 String?cityName;

  void getServices ({required String cityName}) async
  {

     emit(LoadingWeatherState());
     try{
      weatherModel= await weatherServices.getWeather(cityName: cityName);
      print(cityName);
       emit(SuccessWeatherState());
     }
     catch(e)
    {
      emit(FailureWeatherState());
      print('error is $e');
    }
  }

}