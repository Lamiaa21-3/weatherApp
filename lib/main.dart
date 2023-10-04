import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/homePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp( BlocProvider(
    create: (context)
      {
        return WeatherCubit(WeatherServices());
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp

  ({super.key});

  // This widget is the root of your application.
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null? Colors.blue : Colors.orange,
      ),
    );
  }
}