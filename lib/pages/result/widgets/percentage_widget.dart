import 'package:covid19selfcheckapp/state/point.dart';
import 'package:covid19selfcheckapp/values/style.dart';
import 'package:covid19selfcheckapp/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../result_page.dart';

class PercentageWidget extends StatelessWidget {
  final TestResultCategory resultCategory;
  const PercentageWidget({Key key, @required this.resultCategory})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    PointState pointState = Provider.of<PointState>(context);
    return Container(
      height: 215,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: _chooseTestColor(resultCategory)),
      child: Text(
        "${pointState.pointPercentage}%",
        style: percentageTextStyle,
      ),
    );
  }
}

Color _chooseTestColor(TestResultCategory resultCategory) {
  Color color;
  switch (resultCategory) {
    case TestResultCategory.Bad:
      color = AppColors.greenCircleColor;
      break;
    case TestResultCategory.Worse:
      color = AppColors.yellowCircleColor;
      break;
    case TestResultCategory.Worst:
      color = AppColors.redBackgroundColor;
      break;
  }
  return color;
}
