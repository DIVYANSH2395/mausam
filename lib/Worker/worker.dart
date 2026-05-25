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

  void getData() {}
}

Future<Worker> getdata () async{
  Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Location&appid=1c8e7b9a0c3d1f0e4b8c8c8c8c8c8c"));
  Map data = jsonDecode(response.body);

//Getting Description and Main
  List weather_data = data['weather'];
  Map weather_main = weather_data[0];
  String getMain_des = weather_main['main'];
  String getDesc = weather_main['description'];




//Getting Temperature, Humidity
  Map temp_data = data['main'];
 double getHumidity = temp_data['humidity'];
  double getTemp = temp_data['temp'];

//Getting Air Speed

  Map wind = data['wind'];
  double air_speed = wind["speed"];
 

 //Assigning Values and return worker instance
 String tempStr = getTemp.toString();
 String humidityStr = getHumidity.toString();
 String airSpeedStr = air_speed.toString();


 // Get location name if available
 String locationName = data.containsKey('name') ? data['name'].toString() : 'Unknown';

 // Create and return Worker instance
 return Worker(
   location: locationName,
   temp: tempStr,
   humidity: humidityStr,
   air_speed: airSpeedStr,
   description: getDesc,
   main: getMain_des,
 );
}

 

