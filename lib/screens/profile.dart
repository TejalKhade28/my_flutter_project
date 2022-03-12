import 'package:flutter/material.dart';
//import 'package:flutter_dev/screens/main_drawer.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String title = 'Account';
  int _currentStep = 0;
  StepperType _stepperType = StepperType.vertical;
  switchStepType() {
    setState(() => _stepperType == StepperType.vertical
        ? _stepperType = StepperType.horizontal
        : _stepperType = StepperType.vertical);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        
      ),
      body: Stepper(
        steps: _stepper(),
        physics: ClampingScrollPhysics(),
        currentStep: this._currentStep,
        type: _stepperType,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep < this._stepper().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              //your code
              print('Complete');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      ),
      /* floatingActionButton: FloatingActionButton(
          onPressed: switchStepType,
          backgroundColor: Colors.pinkAccent,
          child: Icon(
            Icons.swap_horizontal_circle,
            color: Colors.pinkAccent,
          )),  */
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text('Name'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.complete),
      Step(
          title: Text('Email'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Recovery Email'),
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: Text('Mobile no.'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile number'),
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Alternate mobile number'),
              ),
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.editing),
      Step(
          title: Text('Address'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Address 1'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address 2'),
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.error),
      Step(
          title: Text('Password'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.indexed),
    ];
    return _steps;
  }
}
