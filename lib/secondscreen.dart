import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngsleeptracker/firstscreen.dart';
import 'package:numberpicker/numberpicker.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
              subtitle: Text(
                // TODO to modify
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
                ),
              ),
              subtitle: DropdownButton(
                items: [],
//                  onChanged: (){
//
//                  } ,
                // TODO
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
                ),
              ),
              onTap: () {
                NumberPicker.integer(
                  initialValue: 50,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: null, //TODO
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            onPressed: () {
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
