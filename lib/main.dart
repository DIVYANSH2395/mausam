import 'package:flutter/material.dart';
import 'package:mausam/Activity/Home.dart';
import 'package:mausam/Activity/Loading.dart';
import 'package:mausam/Activity/Location.dart';

void main() {
  runApp(
    MyWidget()
  );




}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loading(),
    );
  }
}
