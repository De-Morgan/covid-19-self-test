import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/check_result/check_result_page.dart';
import 'pages/notification_page/notification_screen.dart';
import 'pages/onboarding/onboarding_screen.dart';
import 'pages/result/result_page.dart';
import 'pages/test_page/test_screen.dart';
import 'state/point.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => OnBoarding(),
    TestPage.routeName: (_) => TestPage(),
    CheckResultPage.routeName: (_) => CheckResultPage(),
    ResultPage.routeName: (_) => ResultPage(),
    NotificationPage.routeName: (_) => NotificationPage(),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Provider<PointState>(
      create: (BuildContext context) => PointState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 Self Test',
        theme: theme,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
