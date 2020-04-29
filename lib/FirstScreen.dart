import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngsleeptracker/SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  List<SleepRecord> sleepRecordList = [];

  ListTile prepareListTile(List<SleepRecord> sleepRecordList, int index) {
    DateTime dateTime = sleepRecordList
        .elementAt(index)
        .currentDateTime;
    String napOrSleep = sleepRecordList
        .elementAt(index)
        .dropdownSelectedValue;
    Duration sleepDuration = sleepRecordList
        .elementAt(index)
        .selectedDuration;

    return ListTile(
      leading: Text(
        '${DateFormat('h:mm\n a').format(dateTime)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        '$napOrSleep',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${sleepDuration.inHours} hours ${sleepDuration.inMinutes.remainder(
            60)} minutes',
      ),
    );
  }

  void awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));

    setState(() {
      sleepRecordList += result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                // TODO maybe find some better icon
                child: Icon(Icons.brightness_3),
              ),
              Text(
                'Get to know your baby\'s sleep patterns and keep\n'
                    ' track of how much sleep they are getting here.',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                height: 25.0,
                width: double.infinity,
              ),
              RaisedButton(
                onPressed: () {
                  awaitReturnValueFromSecondScreen(context);
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
                    constraints:
                    BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Add new sleeping record",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
                width: double.infinity,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                child: Text(
                  '${DateFormat.EEEE().format(new DateTime.now()).toUpperCase()}, '
                      '${DateFormat.d().add_LLL().add_y().format(
                      new DateTime.now()).toUpperCase()}',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: sleepRecordList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: prepareListTile(sleepRecordList, index),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}


