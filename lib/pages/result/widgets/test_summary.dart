

import 'package:covid19selfcheckapp/values/style.dart';
import 'package:flutter/material.dart';

import '../result_page.dart';

class TestSummary extends StatelessWidget {
  final TestResultCategory resultCategory;

  const TestSummary({Key key, @required this.resultCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget resultWidget;
    switch (resultCategory) {
      case TestResultCategory.Bad:
        resultWidget = Column(
          children: <Widget>[
            Text(
              "Negative",
              style: selfTest,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text("Stay Home & avoid large gatherings"),
            ),
          ],
        );
        break;
      case TestResultCategory.Worse:
        resultWidget = Container(
          child: RichText(
            text: TextSpan(
                text: "Please self isolate for ",
                children: [
                  TextSpan(
                      text: "14 days",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold))
                ],
                style: Theme.of(context).textTheme.bodyText1),
          ),
        );
        break;
      case TestResultCategory.Worst:
        resultWidget = Container(
          child: RichText(
            text: TextSpan(
                text: "Please self isolate for ",
                children: [
                  TextSpan(
                      text: "14 days",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold))
                ],
                style: Theme.of(context).textTheme.bodyText1),
          ),
        );
        break;
    }
    return resultWidget;
  }
}
