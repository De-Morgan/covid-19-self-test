import 'package:covid19selfcheckapp/service/notification.dart';
import 'package:covid19selfcheckapp/shared/widgets/covid_self_test.dart';
import 'package:covid19selfcheckapp/shared/widgets/divider_container.dart';
import 'package:covid19selfcheckapp/shared/widgets/faded_background_container.dart';
import 'package:covid19selfcheckapp/values/style.dart';
import 'package:covid19selfcheckapp/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = "/notification";
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int groupValue = -1;

  @override
  void initState() {
    super.initState();
    setNotificationIndexOnLoad();
  }

  void setNotificationIndexOnLoad() async {
    int index = await getNotificationChoiceIndex();
    setState(() {
      groupValue = index;
    });
  }

  void changeValue(int value) {
    setState(() {
      groupValue = value;
    });
    switch (value) {
      //off case
      case -1:
        notificationManager.cancelAllNotification();
        break;
      // 10 minute
      case 0:
        notificationManager.showPeriodicNotification(RepeatInterval.TenMinute);
        break;
      // 20 minute
      case 1:
        notificationManager
            .showPeriodicNotification(RepeatInterval.TWentyMinute);
        break;
      // 30 minute
      case 2:
        notificationManager
            .showPeriodicNotification(RepeatInterval.ThirtyMinute);
        break;
      // 1 hour
      case 3:
        notificationManager.showPeriodicNotification(RepeatInterval.Hourly);
        break;
      // 2 hour
      case 4:
        notificationManager.showPeriodicNotification(RepeatInterval.TwoHours);
        break;
      default:
        break;
    }
    saveNotificationChoiceIndex(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadedBackgroundContainer(),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 150,
                    child: FittedBox(
                        fit: BoxFit.contain, child: CovidSelfTestWidget()),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                DividerContainer(
                  child: Text(
                    "SET NOTIFICATION TO WASH HANDS",
                    textAlign: TextAlign.center,
                    style: travelHistoryStyle,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                RadioListTile(
                  onChanged: changeValue,
                  value: -1,
                  title: Text("OFF"),
                  groupValue: groupValue,
                ),
                RadioListTile(
                  onChanged: changeValue,
                  value: 0,
                  title: Text("Every 10 Minutes"),
                  groupValue: groupValue,
                ),
                RadioListTile(
                  onChanged: changeValue,
                  groupValue: groupValue,
                  value: 1,
                  title: Text("Every 20 Minutes"),
                ),
                RadioListTile(
                  onChanged: changeValue,
                  groupValue: groupValue,
                  value: 2,
                  title: Text("Every 30 Minutes"),
                ),
                RadioListTile(
                  onChanged: changeValue,
                  groupValue: groupValue,
                  value: 3,
                  title: Text("Every 1 Hour"),
                ),
                RadioListTile(
                  onChanged: changeValue,
                  groupValue: groupValue,
                  value: 4,
                  title: Text("Every 2 Hours"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const String notificationKey = "NotificationIndex";
Future<void> saveNotificationChoiceIndex(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(notificationKey, index);
}

Future<int> getNotificationChoiceIndex() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(notificationKey) ?? 2;
}
