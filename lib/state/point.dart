import 'package:covid19selfcheckapp/pages/result/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PointState {
  int point = 0;
  static const int _MAXPOINT = 55;

  void addPoint(int point) {
    this.point += point;
  }

  String get pointPercentage {
    return ((point / _MAXPOINT) * 100).toStringAsFixed(1);
  }

  TestResultCategory getTestResultCategory() {
    TestResultCategory testResultCategory;
    if (point <= 16.5) {
      testResultCategory = TestResultCategory.Bad;
    } else if (point <= 30.25) {
      testResultCategory = TestResultCategory.Worse;
    } else {
      testResultCategory = TestResultCategory.Worst;
    }

    return testResultCategory;
  }
}
