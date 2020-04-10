import 'package:covid19selfcheckapp/utils/lauch_urls.dart';
import 'package:flutter/material.dart';

import '../result_page.dart';

class BuildNCDCContact extends StatelessWidget {
  final TestResultCategory resultCategory;

  const BuildNCDCContact({Key key, @required this.resultCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget resultWidget;
    switch (resultCategory) {
      case TestResultCategory.Bad:
        resultWidget = Container();
        break;
      case TestResultCategory.Worse:
      case TestResultCategory.Worst:
        resultWidget = Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("CONTACT NCDC ON:"),
              SizedBox(
                height: 5,
              ),
              InkWell(onTap: callNCDC, child: Text(" 0800 9700 0010")),
              SizedBox(
                height: 5,
              ),
              Text("Twitter"),
              InkWell(onTap: openNCDCTwitterPage, child: Text("@NCDCgov")),
            ],
          ),
        );
        break;
    }
    return resultWidget;
  }
}
