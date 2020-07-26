import 'package:flutter/material.dart';
import 'package:ngsleeptracker/models/sleep_record.dart';

class SleepRecordList extends ChangeNotifier {
  List<SleepRecord> sleepRecordList = [];

  void addRecordAtFirsPosition(SleepRecord sleepRecord) {
    sleepRecordList.insert(0, sleepRecord);
    notifyListeners();
  }

  SleepRecord getElementAtIndex(int index) {
    return sleepRecordList.elementAt(index);
  }

  int getListLength() {
    return sleepRecordList.length;
  }
}
