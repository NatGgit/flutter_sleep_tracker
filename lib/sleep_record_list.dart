import 'package:flutter/material.dart';
import 'package:ngsleeptracker/sleep_record.dart';

class SleepRecordList extends ChangeNotifier {
  final List<SleepRecord> _sleepRecordList = [];

  void addRecordAtFirsPosition(SleepRecord sleepRecord) {
    _sleepRecordList.insert(0, sleepRecord);
    notifyListeners();
  }

  SleepRecord getElementAtIndex(int index) {
    return _sleepRecordList.elementAt(index);
  }

  int getListLength() {
    return _sleepRecordList.length;
  }
}
