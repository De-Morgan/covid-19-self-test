import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String GROUPCHANNELID = "LOCALNOTIFICATIONID";
const String GROUPCHANNELNAME = "Wash Hands Reminder";
const String GROUPCHANNELDESCRIPTION =
    "A notification to remind you to wash your hands";

class NotificationManager {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  void initializeNotification(selectNotificationCallback,
      [Function onDidReceiveLocalNotification]) {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotificationCallback);
  }

  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  void showPeriodicNotification(RepeatInterval repeatInterval) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        GROUPCHANNELID, GROUPCHANNELNAME, GROUPCHANNELDESCRIPTION);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        "Wash Your Hands Reminder",
        "It's about time to washed your hands",
        repeatInterval,
        platformChannelSpecifics);
  }
}

final notificationManager = NotificationManager();
