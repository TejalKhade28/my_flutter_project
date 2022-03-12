import 'package:flutter/material.dart';
import 'package:charitable/modelelec/destination.dart';
import 'package:charitable/screens/form_screen.dart';

import 'homescreenelec.dart';

class DestinationScreenshoes extends StatefulWidget {
  final Destination destination;

  const DestinationScreenshoes({Key key, this.destination}) : super(key: key);
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreenshoes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.destination.image),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 10,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.black,
                            )),*/
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreenElec()));
                          },
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            )
                          ]),
                      transform: Matrix4.translationValues(0, 20, 0),
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          )),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.destination.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.destination.description,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  RaisedButton(
                    color: Colors.lightBlueAccent,
                    //shape: StadiumBorder(),
                    child: Text(
                      'Accept Donation',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
