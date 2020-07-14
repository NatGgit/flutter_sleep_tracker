import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngsleeptracker/sleep_record.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> _dropdownOptions = ["Night's Sleep", 'Nap'];
  String selectedValue;

  Duration sleepDuration = const Duration();

  Text formatDateTime() {
    final DateTime dateInOurZone = DateTime.now().add(const Duration(hours: 2));
    return Text(
      '${DateFormat.d().add_LLLL().add_y().format(dateInOurZone)}, '
      '${DateFormat.Hm().format(dateInOurZone)}',
      style: const TextStyle(
        fontSize: 17.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Sleep Tracker'),
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 10.0,
          ),
          Container(height: 130, child: Image.asset('images/cloud.png')),
          const SizedBox(
            height: 10.0,
          ),
          Card(
            margin: const EdgeInsets.all(5.0),
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
                child: formatDateTime(),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5.0),
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
                value: selectedValue,
                onChanged: (String newValue) {
                  setState(() {
                    selectedValue = newValue;
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
            margin: const EdgeInsets.all(5.0),
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
                onPressed: () {
                  // corrected due to changes in analysis_options (type added)
                  showDialog<AlertDialog>(
                      context: context,
                      builder: (BuildContext builder) {
                        return AlertDialog(
                          content: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 3,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              minuteInterval: 5,
                              initialTimerDuration: sleepDuration,
                              onTimerDurationChanged: (Duration newDuration) {
                                setState(() {
                                  sleepDuration = newDuration;
                                });
                              },
                            ),
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            )
                          ],
                        );
                      });
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${sleepDuration.inHours}:${sleepDuration.inMinutes
                        .remainder(60)}',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          RaisedButton(
            onPressed: () {
              final SleepRecord sleepRecordToAdd =
              SleepRecord(DateTime.now(), selectedValue, sleepDuration);
              if (selectedValue != null && !(sleepDuration.inMinutes == 0)) {
                Navigator.pop(context, sleepRecordToAdd);
              } else {
                // corrected due to changes in analysis_options (type added)
                showDialog<AlertDialog>(
                    context: context,
                    builder: (BuildContext builder) {
                      return AlertDialog(
                        title: const Text('Please fill all the fields.'),
                        actions: [
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          )
                        ],
                      );
                    });
              }
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
                constraints: const BoxConstraints(
                    maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Save',
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
