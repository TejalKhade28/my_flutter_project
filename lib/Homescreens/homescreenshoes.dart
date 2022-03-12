// import 'package:charitable/modelbooks/destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:charitable/modelshoes/destination.dart';
import 'package:charitable/Homescreens/destinationscreenshoes.dart';

class HomeScreenshoes extends StatefulWidget {
  @override
  _HomeScreenshoesState createState() => _HomeScreenshoesState();
}

class _HomeScreenshoesState extends State<HomeScreenshoes> {
  int _index = 0;
  //int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shoes...',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                'Our app aims to make the used shoes of different types available to everyone thereby ensuring utilisation of the excess shoes availabele with donor.',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: PageView.builder(
                  itemCount: destinations.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: i == _index ? 1.0 : 0.9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DestinationScreenshoes(
                                    destination: destinations[i],
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(destinations[i].image),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(2, 3),
                                    )
                                  ]),
                            ),
                            Text(
                              destinations[i].name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
