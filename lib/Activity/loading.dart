import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

Worker instance = Worker (location: "Bhilwara", temp: '', humidity: '', air_speed: '', description: '', main: '');

void startApp() async {
    Worker instance = Worker (location: "Bhilwara", temp: '', humidity: '', air_speed: '', description: '', main: '');

  instance.getData();
  print(instance.air_speed);
}

@ override
void initState() {  
  print(instance.air_speed);
  startApp();
  super.initState();

} 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
      body: SafeArea(
        child: Column( children: <Widget>[
        ElevatedButton.icon(onPressed: (){
          Navigator.pushNamed(context, "/home");
        
        }, icon: Icon (Icons.add_to_home_screen),label: Text("Go to Home"))
        ],
        ),
      ),
    );
  }
}