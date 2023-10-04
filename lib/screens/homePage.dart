import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:  Theme.of(context).primaryColor,
        title: const Text("Weather"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    SearchScreen()),
              ).then((value) {

              });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is LoadingWeatherState) {
              return Center(child: CircularProgressIndicator(),);
            }
            else if (state is SuccessWeatherState) {
              weatherData=  BlocProvider.of<WeatherCubit>(context).weatherModel;
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      weatherData!.getThemeColor(),
                      weatherData!.getThemeColor()[300]!,
                      weatherData!.getThemeColor()[100]!,

                    ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                    )
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text("${BlocProvider.of<WeatherCubit>(context).cityName}",
                        style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(
                      "update :  ${weatherData?.temp}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("${weatherData?.getImage()}"),
                        Text(
                          "${weatherData?.temp}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text("maxTemp : ${weatherData?.maxTemp}"),
                            Text("minTemp : ${weatherData?.minTemp}"),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("${weatherData?.weatherState}",
                        style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              );
            }
            else if (state is FailureWeatherState) {
              return Center(child: Text(' something is wrong'),);
            }
            else {
              return Center(
                child: Text(
                  "there is no weather start searching now",
                  style: TextStyle(fontSize: 25),
                ),
              );
            }
          }
      ),
    );
  }


}