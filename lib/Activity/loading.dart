import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // App Start Hote he 5sec wait then home page pr redirectby context 
  void startApp() async {

  await Future.delayed(Duration(seconds: 3));

  Worker instance = Worker(
    location: 'Ajmer',
    temp: '',
    humidity: '',
    air_speed: '',
    description: '',
    main: '',
  );

  await instance.getData();

  if (!mounted) return;

  Navigator.pushReplacementNamed(
    context,
    "/home",
    arguments: {
      "temp": instance.temp,
      "air_speed": instance.air_speed,
      "humidity": instance.humidity,
      "description": instance.description,
      "main": instance.main,
      "icon": instance.icon,
    },
  );
}

@override
void initState() {
  super.initState();
  startApp();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("hello"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  
          children: <Widget>[
            Image.asset("lib/images/image.png",height: 230.0, width: 230.0,),
            Text ("Mausam App",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),),
            SizedBox(height: 20.0,),
            Text ("Made By Divyanshu Suwalka",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
            SizedBox(height: 40.0,),
            SpinKitWave(
  color: Colors.red,
  size: 50.0,
),
          ]
        
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}