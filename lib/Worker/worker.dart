import 'package:http/http.dart';
import 'dart:convert';



class worker {
  String location;
  String temp;
  String humidity;
  String air_speed;
  String description;

  worker({
    required this.location,
    required this.temp,
    required this.humidity,
    required this.air_speed,
    required this.description,
  });
}