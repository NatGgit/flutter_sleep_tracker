import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngsleeptracker/firstscreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> _dropdownOptions = ['Night\'s Sleep', 'Nap'];
  String _selectedValue;

  Duration initialDuration = new Duration();

  int selectItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //should add back button
        automaticallyImplyLeading: true,
        title: Text('Sleep Tracker'),
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(height: 130, child: Image.asset('images/cloud.png')),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.indigo[900],
              ),
              title: Text(
                'Date and time',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  '${DateFormat.d().format(new DateTime.now())} '
                  '${DateFormat.LLLL().format(new DateTime.now())} '
                  '${DateFormat.y().format(new DateTime.now())}, '
                  '${DateFormat.Hm().format(new DateTime.now())}',
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.brightness_3,
                color: Colors.indigo[900],
              ),
              title: Text(
                'Sleep type',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: DropdownButton<String>(
                hint: Text(
                  'Night, nap, etc',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                value: _selectedValue,
                onChanged: (String newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: _dropdownOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.indigo[900],
              ),
              title: Text(
                'Sleep duration',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: FlatButton(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${initialDuration.inHours}:${initialDuration.inMinutes.remainder(60)}',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 17.0,
                        ),
                      )),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext builder) {
                          return AlertDialog(
                            content: Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3,
                              child: CupertinoTimerPicker(
                                mode: CupertinoTimerPickerMode.hm,
                                minuteInterval: 5,
                                initialTimerDuration: initialDuration,
                                onTimerDurationChanged: (Duration newDuration) {
                                  setState(() {
                                    initialDuration = newDuration;
                                  });
                                },
                              ),
                            ),
                          );
                        });
                  }),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            onPressed: () {
              //TODO: make app actually save data
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new FirstScreen()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
