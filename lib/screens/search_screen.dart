import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

WeatherModel? weatherData;

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController()..text;
  String? cityName;
  VoidCallback? updateUi;

  SearchScreen({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices services = WeatherServices();
              WeatherModel? weather =
                  await services.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              updateUi!();

              Navigator.of(context).pop(weather);
            },
            controller: searchController,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              hintText: "enter city name ",
              label: Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}
