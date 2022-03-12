import 'package:flutter/material.dart';
import 'package:charitable/Homescreens/homescreenshoes.dart';

void main() {
  runApp(MyShoes());
}

class MyShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenshoes(),
    );
  }
}