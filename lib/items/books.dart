import 'package:flutter/material.dart';
import 'package:charitable/Homescreens/HomeScreenbooks.dart';

void main() {
  runApp(MyBooks());
}

class MyBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenbooks(),
    );
  }
}