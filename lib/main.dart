import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FirstScreen.dart';

void main() {
  runApp(SleepTracker());
}

class SleepTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}
