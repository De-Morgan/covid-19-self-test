import 'package:covid19selfcheckapp/state/point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactWithInfectedPerson extends StatefulWidget {
  @override
  _ContactWithInfectedPersonState createState() =>
      _ContactWithInfectedPersonState();
}

class _ContactWithInfectedPersonState extends State<ContactWithInfectedPerson> {
  static const int _maxPoint = 20;
  int _pointGot = 0;
  PointState pointState;

  int groupValue = -1;
  void changeValue(int value) {
    setState(() {
      groupValue = value;
    });
    switch (value) {
      //yes case
      case 0:
        _pointGot = 15;
        break;
      //no case
      case 1:
        _pointGot = 2;
        break;
      //not sure case
      case 2:
        _pointGot = 5;
        break;
      default:
        _pointGot = _pointGot;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pointState = Provider.of<PointState>(context, listen: false);
  }

  @override
  void dispose() {
    pointState.addPoint(_pointGot);
    print("$_pointGot is added to Pointstate");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RadioListTile<int>(
              onChanged: changeValue,
              value: 0,
              title: Text("YES"),
              groupValue: groupValue,
            ),
            RadioListTile<int>(
              onChanged: changeValue,
              value: 1,
              title: Text("NO"),
              groupValue: groupValue,
            ),
            RadioListTile<int>(
              onChanged: changeValue,
              value: 2,
              title: Text("Not Sure"),
              groupValue: groupValue,
            ),
          ],
        ),
      ),
    );
  }
}
