import 'package:flutter/material.dart';

class DateTimePickerPage extends StatefulWidget {
  @override
  _DateTimePickerPageState createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {
  DateTime pickedDate;
  TimeOfDay time;
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F35A5),
        title: Text('Fix a meeting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text(
                "Date:\n\nDD/MM/YYYY\n${pickedDate.day}/${pickedDate.month}/${pickedDate.year}\n",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            ListTile(
              title: Text(
                "Time:\n\nHour:Minutes\n${time.hour}:${time.minute}\n\n\n",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            ),
            RaisedButton(
              color: Colors.green,
              shape: StadiumBorder(),
              child: Text(
                '        Fix Meet        ',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }
}
