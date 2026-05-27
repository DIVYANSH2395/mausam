import 'package:http/http.dart';
import 'dart:convert';

class Worker {

  String location;
  String temp;
  String humidity;
  String air_speed;
  String description;
  String main;

  Worker({
    required this.location,
    required this.temp,
    required this.humidity,
    required this.air_speed,
    required this.description,
    required this.main,
  });
}

// Function
Future<Worker> getData() async {

  Response response = await get(
    Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=bhilwara&appid=a6993ccca3cf38ff015a5c11228d9260",
    ),
  );

  Map data = jsonDecode(response.body);

  // Weather
  List weatherData = data['weather'];
  Map weatherMain = weatherData[0];

  String getMain = weatherMain['main'];
  String getDesc = weatherMain['description'];

  // Temperature & Humidity
  Map mainData = data['main'];

  double getTemp = data['main']['temp'];
  int getHumidity = data['main']['humidity'];

  // Wind Speed
  Map wind = data['wind'];

  double getAirSpeed = wind['speed'];

  // Location Name
  String location = data['name'];

  // Return Object
  return Worker(
    location: location,
    temp: getTemp.toString(),
    humidity: getHumidity.toString(),
    air_speed: getAirSpeed.toString(),
    description: getDesc,
    main: getMain,
  );
}