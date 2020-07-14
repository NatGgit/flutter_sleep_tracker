import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngsleeptracker/second_screen.dart';
import 'package:ngsleeptracker/sleep_record.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<SleepRecord> sleepRecordList = [];

  ListTile prepareListTile(List<SleepRecord> sleepRecordList, int index) {
    final DateTime dateTime = sleepRecordList.elementAt(index).currentDateTime;
    final String napOrSleep =
        sleepRecordList.elementAt(index).dropdownSelectedValue;
    final Duration sleepDuration =
        sleepRecordList.elementAt(index).selectedDuration;

    return ListTile(
      leading: Text(
        // ignore: unnecessary_string_interpolations
        '${DateFormat('h:mm\n a').format(dateTime)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        napOrSleep,
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

  Future<void> awaitReturnValueFromSecondScreen(BuildContext context) async {
    final SleepRecord result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));

    setState(() {
      if (result == null) {
        sleepRecordList = sleepRecordList;
      } else {
        sleepRecordList.insert(0, result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Tracker'),
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        children: [
          Container(
            height: 70.0,
            width: 70.0,
            child: Icon(
              Icons.brightness_3,
              color: Colors.orange,
            ),
          ),
          Text(
            "Get to know your baby's sleep patterns and keep\n"
                " track of how much sleep they are getting here.",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 25.0,
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              awaitReturnValueFromSecondScreen(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints:
                const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Add new sleeping record',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 15),
            alignment: Alignment.bottomLeft,
            child: Text(
              '${DateFormat.EEEE().format(DateTime.now()).toUpperCase()}, '
                  '${DateFormat.d().add_LLL().add_y()
                  .format(DateTime.now())
                  .toUpperCase()}',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            alignment: Alignment.topLeft,
            child: ListView.builder(
                itemCount: sleepRecordList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: prepareListTile(sleepRecordList, index),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
