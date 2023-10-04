import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

WeatherModel? weatherData;

class SearchScreen extends StatefulWidget {




  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController()..text;

  String? cityName;

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
              setState(() {
                cityName = data;
              });

              print('data is $data');

                BlocProvider.of<WeatherCubit>(context).getServices(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName =cityName;
              Navigator.of(context).pop(context);
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
