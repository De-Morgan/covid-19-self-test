import 'package:covid19selfcheckapp/pages/test_page/test_screen.dart';
import 'package:covid19selfcheckapp/service/notification.dart';
import 'package:covid19selfcheckapp/shared/widgets/covid_self_test.dart';
import 'package:covid19selfcheckapp/values/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'loading_animation.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void _goToTestPage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, TestPage.routeName);
    });
  }

  @override
  void initState() {
    super.initState();
    notificationManager
      ..initializeNotification(onSelectSeedNotification)
      ..showPeriodicNotification(RepeatInterval.ThirtyMinute);
    _goToTestPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.covidBackgroundDecoration,
        child: Container(
            child: Column(
          children: <Widget>[
            Spacer(),
            CovidSelfTestWidget(),
            Container(
                margin: EdgeInsets.only(
                  top: 17,
                ),
                child: LoadindDots()),
            Spacer(
              flex: 2,
            )
          ],
        )),
      ),
    );
  }

  Future onSelectSeedNotification(String payload) async {}
}
