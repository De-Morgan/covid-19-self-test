import 'package:covid19selfcheckapp/pages/result/result_page.dart';
import 'package:covid19selfcheckapp/shared/widgets/covid_self_test.dart';
import 'package:covid19selfcheckapp/state/point.dart';
import 'package:covid19selfcheckapp/values/style.dart';
import 'package:covid19selfcheckapp/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckResultPage extends StatelessWidget {
  static const routeName = "/pages.result";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        //Disabled back button for the pages.result screen
        onWillPop: () async => false,
        child: Container(
          decoration: AppDecoration.covidBackgroundDecoration,
          child: Column(
            children: <Widget>[
              Spacer(),
              CovidSelfTestWidget(),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () => Navigator.pushReplacementNamed(
                    context, ResultPage.routeName),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: AppDecoration.textBackgroundDecoration,
                  child: Text(
                    "CHECK RESULT",
                    style: checkResultTextStyle,
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
