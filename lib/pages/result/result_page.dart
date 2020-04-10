import 'package:covid19selfcheckapp/shared/widgets/covid_self_test.dart';
import 'package:covid19selfcheckapp/state/point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/build_ncdc_contact.dart';
import 'widgets/percentage_widget.dart';
import 'widgets/test_summary.dart';

enum TestResultCategory { Bad, Worse, Worst }

class ResultPage extends StatelessWidget {
  static const routeName = "/testResult";
  @override
  Widget build(BuildContext context) {
    final TestResultCategory resultCategory =
        Provider.of<PointState>(context).getTestResultCategory();
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            SizedBox(
                height: 225,
                child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(child: CovidSelfTestWidget()))),
            Spacer(),
            PercentageWidget(
              resultCategory: resultCategory,
            ),
            Spacer(),
            TestSummary(
              resultCategory: resultCategory,
            ),
            Spacer(
              flex: 2,
            ),
            BuildNCDCContact(
              resultCategory: resultCategory,
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
