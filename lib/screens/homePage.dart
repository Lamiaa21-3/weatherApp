import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi()
  {
    setState(() {

    });

  }
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen(updateUi: updateUi,)),
              ).then((value) {
                setState(() {
                  weatherData = value;
                });
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Provider.of<WeatherProvider>(context,listen: true).weatherData == null
          ? Center(
              child: Text(
                "there is no weather start searching now",
                style: TextStyle(fontSize: 25),
              ),
            )
          : Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text("Cairo",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(
                    "update : 33-4",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(""),
                      Text(
                        "30",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text("maxTemp : 33"),
                          Text("minTemp : 22"),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text("Cairo",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
