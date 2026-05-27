import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    Map info =
        ModalRoute.of(context)?.settings.arguments as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Activity"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          FloatingActionButton(
            onPressed: () {},
          ),

          Text(info['temp_value']?.toString() ?? "No Temp"),

          Text(info['hum_value']?.toString() ?? "No Humidity"),

          Text(info['air_speed_value']?.toString() ?? "No Air Speed"),

          Text(info['description_value']?.toString() ?? "No Description"),

          Text(info['main_value']?.toString() ?? "No Main"),
        ],
      ),
    );
  }
}