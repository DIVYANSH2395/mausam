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

  get icon => null;

  Future<void> getData() async {}
}

Future<Worker> getData() async {
  try {
    Response response = await get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Bhilwara&appid=a6993ccca3cf38ff015a5c11228d9260&units=metric",
      ),
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      // Weather Data
      String getMain = data['weather'][0]['main'];
      String getDesc = data['weather'][0]['description'];

      // Temperature & Humidity
      double getTemp = data['main']['temp'].toDouble();
      int getHumidity = data['main']['humidity'];

      // Wind Speed
      double getAirSpeed = data['wind']['speed'].toDouble();

      // Location
      String location = data['name'];

      return Worker(
        location: location,
        temp: getTemp.toString(),
        humidity: getHumidity.toString(),
        air_speed: getAirSpeed.toString(),
        description: getDesc,
        main: getMain,
      );
    } else {
      throw Exception("API Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");

    return Worker(
      location: "Unknown",
      temp: "0",
      humidity: "0",
      air_speed: "0",
      description: "No Data",
      main: "Error",
    );
  }
}