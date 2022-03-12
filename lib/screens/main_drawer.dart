import 'package:charitable/screens/drafts.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dev/Screenswelcome/Welcome/components/body.dart';
//import 'package:flutter_dev/main.dart';

// import 'package:charitable/screens/drafts.dart';
// import 'package:charitable/screens/location.dart';
//import 'package:flutter_dev/screens/aboutUs.dart';

import 'package:charitable/screens/profile.dart';
import 'package:charitable/screens/feedbacks.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOGAcf_PgOsgP7Rf8dkKBI2nDp9K4LfHsopA&usqp=CAU'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Sakshi Khedekar',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    'sakshimk99@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text(
              'feedback',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FeedBack()));
            },
          ),
          ListTile(
            leading: Icon(Icons.drafts),
            title: Text(
              'My Donations',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Draft()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About Us',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              /*Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));*/
              showAboutDialog(
                  context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'About Donate',
                  applicationVersion: '0.0.1',
                  applicationLegalese:
                      'Every good Act Counts.Thereby our app would simplify the process of donation and make charity give and take mainstream.One person can’t help all. But all can help all.Since charity doesn’t depend depend on the size of the donor’s pocket, but his/her heart.Thereby our app would simplify the process of donation and make charity give and take mainstream.Let,s use “Donate” and make charity give and take mainstream!!!');
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text(
              'Location',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainDrawer()));
            },
          ),
          /*ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),*/
        ],
      ),
    );
  }
}
