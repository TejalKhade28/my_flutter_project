import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charitable/screens/datetimepicker.dart';
import 'package:charitable/screens/grid.dart';
//import 'package:flutter_dev/screens/home/components/body.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _address;
  //String _day;
  //String _time;
  String _phoneNumber;
  //String _calories;
  String _description;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Item type',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Shoe type is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      maxLength: 40,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  /*Widget _buildDay() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pickup Day and Time',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      maxLength: 10,
      //keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'PickUp Day is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _day = value;
      },
    );
  }*/

  /* Widget _buildTime() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pickup Time',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      //keyboardType: TextInputType.url,
      maxLength: 6,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Pickup Time is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _time = value;
      },
    );
  }*/

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      keyboardType: TextInputType.phone,
      maxLength: 11,
      validator: (String value) {
        if (value.isEmpty) {
          return 'phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  /*DateTime pickeddate;

    void initState() {
      super.initState();
      pickeddate = DateTime.now();
    }

    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        children: 
      ),
    );*/

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      maxLength: 40,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF6F35A5), title: Text("Recepient Form")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildAddress(),
              _buildEmail(),
              _buildPhoneNumber(),
              _buildDescription(),
              SizedBox(height: 100),
              RaisedButton(
                color: Colors.green,
                shape: StadiumBorder(),
                child: Text(
                  'Fix a meeting',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DateTimePickerPage()));
                },
              ),
              RaisedButton(
                color: Colors.blue,
                shape: StadiumBorder(),
                child: Text(
                  'Check validation',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_address);
                  print(_email);
                  print(_phoneNumber);

                  print(_description);
                },
              ),
              RaisedButton(
                color: Colors.red,
                shape: StadiumBorder(),
                child: Text(
                  'Submit form',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                            title: "Successfully\nsubmitted!!!",
                            description:
                                "Thank you so much for donating and giving your valuable contribution towards society.",
                          ));
                },
              ),
            ],
          ),
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
                        MaterialPageRoute(builder: (context) => Mygrid()));
                  },
                  child: Text("Okay!"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 12,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 50,
            backgroundImage: AssetImage("assets/images/success.gif"),
          ),
        )
      ],
    );
  }
}
