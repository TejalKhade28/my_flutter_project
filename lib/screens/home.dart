// import 'package:charitable/screens/donorform.dart';
// import 'package:charitable/screens/main_drawer.dart';
// import 'package:flutter_dev/screens/services/auth.dart';
import 'package:charitable/screens/main_drawer.dart';
// import 'package:charitable/screens/profile.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
// import 'package:charitable/screens/chats.dart';
import 'package:charitable/screens/grid.dart';

class Home extends StatelessWidget {
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Welcome to Donate'),
        backgroundColor: Color(0xFF6F35A5),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              // await _auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              "It's Better To Donate than to Accumulate",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            Container(
              //height: MediaQuery.of(context).size.height / 2,
              height: 320.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: 350.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.redAccent,
                //shape: StadiumBorder(),
                child: Text(
                  'Explore more',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mygrid()));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: 350.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.green,
                //shape: StadiumBorder(),
                child: Text(
                  'Display profile ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainDrawer()));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: 350.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.orangeAccent,
                //shape: StadiumBorder(),
                child: Text(
                  ' My Chats ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mygrid()));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: 350.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.lightBlue,
                //shape: StadiumBorder(),
                child: Text(
                  ' Add Donation ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mygrid()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
