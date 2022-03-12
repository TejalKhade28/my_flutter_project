import 'package:charitable/items/elec.dart';
import 'package:charitable/items/shoes.dart';
import 'package:flutter/material.dart';
import 'package:charitable/items/books.dart';
import 'package:charitable/items/clothes.dart';
// import 'package:charitable/items/books.dart';

void main() => runApp(MaterialApp(home: Mygrid()));

class Mygrid extends StatefulWidget {
  @override
  _MygridState createState() => _MygridState();
}

class _MygridState extends State<Mygrid> {
  List<String> events = [
    "Books",
    "Clothes",
    "Electronics",
    "Shoes",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 120.0),
          child: GridView(
            physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: events.map((title) {
              return GestureDetector(
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  child: getCardByTitle(title),
                ),
                onTap: () {
                  if (title == "Books") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyBooks()));
                  } else if (title == "Clothes") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyCloth()));
                  } else if (title == "Electronics") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyElec()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyShoes()));
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Column getCardByTitle(String title) {
    String img = "";
    if (title == "Books")
      img = "assets/images/booksgrid.jpg";
    else if (title == "Clothes")
      img = "assets/images/clothesgrid.jpg";
    else if (title == "Electronics")
      img = "assets/images/electronicgrid.jpg";
    else
      img = "assets/images/shoegrid.jpg";
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: Container(
              child: new Stack(children: <Widget>[
                new Image.asset(
                  img,
                  width: 80.0,
                  height: 80.0,
                )
              ]),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ]);
  }
}
