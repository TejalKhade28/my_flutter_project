import 'package:flutter/material.dart';
import 'package:charitable/Homescreens/homescreencloth.dart';

void main() {
  runApp(MyCloth());
}

class MyCloth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenCloth(),
    );
  }
}