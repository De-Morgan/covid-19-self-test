import 'package:covid19selfcheckapp/pages/notification_page/notification_screen.dart';
import 'package:covid19selfcheckapp/shared/widgets/covid_self_test.dart';
import 'package:covid19selfcheckapp/shared/widgets/faded_background_container.dart';
import 'package:covid19selfcheckapp/values/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/test_pager.dart';

class TestPage extends StatelessWidget {
  static const String routeName = "/test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadedBackgroundContainer(),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 160,
                  child: FittedBox(
                      fit: BoxFit.contain, child: CovidSelfTestWidget()),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(child: TestPagerWidget())
            ],
          ),
          Positioned(
              right: 20,
              top: 20,
              child: IconButton(
                  icon: Icon(Icons.notifications_active),
                  color: AppColors.redBackgroundColor,
                  onPressed: () {
                    Navigator.pushNamed(context, NotificationPage.routeName);
                  }))
        ],
      ),
    );
  }
}
