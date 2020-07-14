import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngsleeptracker/sleep_record_list.dart';
import 'package:provider/provider.dart';

import 'first_screen.dart';

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
      ),
    );
  }
}
