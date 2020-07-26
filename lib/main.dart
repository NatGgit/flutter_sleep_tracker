import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/sleep_record_list.dart';
import 'screens/first_screen.dart';

void main() {
  runApp(SleepTracker());
}

class SleepTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SleepRecordList>(
        create: (context) => SleepRecordList(),
        child: MaterialApp(
          home: FirstScreen(),
        ));
  }
}
