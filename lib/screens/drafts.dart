import 'package:flutter/material.dart';
import 'package:charitable/screens/main_drawer.dart';

void main() {
  runApp(MyDraft());
}

class Draft extends StatelessWidget {
  @override
  //_MyDraftState createState() => _MyDraftState();
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF6F35A5),
          title: Text("My Donations"),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainDrawer()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: MyDraft(),
      ),
    );
  }
}

class MyDraft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drafts = ['Donation 1', 'Donation 2', 'Donation 3'];
    return ListView.builder(
      itemCount: drafts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: new Text(drafts[index]),
        );
      },
    );
  }
}