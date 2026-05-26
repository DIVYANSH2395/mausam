import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
      ),
      body:  
      Column(
        children: <Widget>[
          FloatingActionButton(onPressed: () {},
            
          ),
          
          Text(info ['temp_value']),
          Text(info ['hum_value']),
          Text(info ['air_speed_value']),
          Text(info ['description_value']),
          Text(info ['main_value']),
        ],
      )
    );
  }
}