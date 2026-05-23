import 'package:http/http.dart';
import 'dart:convert';



class worker {
  String location;
  String temp;
  String humidity;
  String air_speed;
  String description;
  String main;
  worker({
    required this.location,
    required this.temp,
    required this.humidity,
    required this.air_speed,
    required this.description,
    required this.main,
  });
}

void getdata () async{
  Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Delhi&appid=1c8e7b9a0c3d1f0e4b8c8c8c8c8c8c"));
  Map data = jsonDecode(response.body);

//Getting Description and Main
  List weather_data = data['weather'];
  Map weather_main = weather_data[0];
  String main_des = weather_main['main'];
  String desc = weather_main['description'];




//Getting Temperature, Humidity
  Map temp_data = data['main'];
 double humidity = temp_data['humidity'];
  double temp = temp_data['temp'];

//Getting Air Speed

  Map wind = data['wind'];
  double air_speed = wind["speed"];
 

 //Assigning Values
 
  
}