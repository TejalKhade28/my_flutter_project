import 'package:flutter/material.dart';
import 'package:charitable/Homescreens/HomeScreenelec.dart';

void main() {
  runApp(MyElec());
}

class MyElec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenElec(),
    );
  }
}