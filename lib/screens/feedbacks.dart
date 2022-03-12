import 'package:flutter/material.dart';
import 'package:charitable/screens/main_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainDrawer()));
              //
            }),
        title: Text("Feedback"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.solidStar),
              onPressed: () {
                //
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: Text(
                  "1. On a scale of 1 to 10, how satisfied are you with our donations?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 320.0,
                      height: 470.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Text(
                              myFeedbackText,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.0),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Icon(
                              myFeedback,
                              color: myFeedbackColor,
                              size: 100.0,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Slider(
                                min: 0.0,
                                max: 10.0,
                                divisions: 5,
                                value: sliderValue,
                                activeColor: Color(0xffe05f2c),
                                inactiveColor: Colors.blueGrey,
                                onChanged: (newValue) {
                                  setState(() {
                                    sliderValue = newValue;
                                    if (sliderValue >= 0.0 &&
                                        sliderValue <= 2.0) {
                                      myFeedback = FontAwesomeIcons.sadTear;
                                      myFeedbackColor = Colors.red;
                                      myFeedbackText = "COULD BE BETTER";
                                    }
                                    if (sliderValue >= 2.1 &&
                                        sliderValue <= 4.0) {
                                      myFeedback = FontAwesomeIcons.frown;
                                      myFeedbackColor = Colors.yellow;
                                      myFeedbackText = "BELOW AVERAGE";
                                    }
                                    if (sliderValue >= 4.1 &&
                                        sliderValue <= 6.0) {
                                      myFeedback = FontAwesomeIcons.meh;
                                      myFeedbackColor = Colors.amber;
                                      myFeedbackText = "NORMAL";
                                    }
                                    if (sliderValue >= 6.1 &&
                                        sliderValue <= 8.0) {
                                      myFeedback = FontAwesomeIcons.smile;
                                      myFeedbackColor = Colors.green;
                                      myFeedbackText = "GOOD";
                                    }
                                    if (sliderValue >= 8.1 &&
                                        sliderValue <= 10.0) {
                                      myFeedback = FontAwesomeIcons.laugh;
                                      myFeedbackColor = Colors.pink;
                                      myFeedbackText = "EXCELLENT";
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: Text(
                                  "Your Rating: $sliderValue",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: TextField(
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blueGrey)),
                                  hintText: 'Add Comment',
                                ),
                                style: TextStyle(height: 3.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Align(
                              alignment: Alignment.bottomRight,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Color(0xffe05f2c),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Color(0xffffffff)),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => CustomDialog(
                                            title: "Successfully\nsubmitted!!!",
                                            description:
                                                "Thank you so much for your valuable feedback for our App..",
                                          ));
                                },
                              ),
                            )),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 24.0),
              Text(description, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainDrawer()));
                  },
                  child: Text("Okay!"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 50,
            backgroundImage: AssetImage("assets/images/happyface.gif"),
          ),
        )
      ],
    );
  }
}