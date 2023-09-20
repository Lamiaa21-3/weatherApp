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
//    return ' temp = $temp minTemp $minTemp maxTemp $maxTemp date $date';
}
