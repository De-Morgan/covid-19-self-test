import 'package:covid19selfcheckapp/state/point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SymptomsWidget extends StatefulWidget {
  @override
  _SymptomsWidgetState createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends State<SymptomsWidget> {
  static const int _maxPoint = 20;
  int _pointGot = 0;
  PointState pointState;
  void addPoint(int point) {
    _pointGot += point;
    print("Point is now $_pointGot");
  }

  void subtractPoint(int point) {
    _pointGot -= point;
    if (_pointGot <= 0) {
      _pointGot = 0;
    }
    print("Point is now $_pointGot");
  }

  bool headache = false;
  void _changeHeadacheChecked(bool value) {
    setState(() {
      headache = value;
    });

    if (value) {
      addPoint(3);
    } else {
      subtractPoint(3);
    }
  }

  bool fever = false;

  void changeFeverChecked(bool value) {
    setState(() {
      fever = value;
    });
    if (value) {
      addPoint(7);
    } else {
      subtractPoint(7);
    }
  }

  bool tiredChecked = false;

  void changeTiredChecked(bool value) {
    setState(() {
      tiredChecked = value;
    });
    if (value) {
      addPoint(5);
    } else {
      subtractPoint(5);
    }
  }

  bool dryCoughChecked = false;

  void changeDryCoughChecked(bool value) {
    setState(() {
      dryCoughChecked = value;
    });
    if (value) {
      addPoint(8);
    } else {
      subtractPoint(8);
    }
  }

  bool difficultyInBreathingChecked = false;

  void _changeDifficultyInBreathingCheckedChecked(bool value) {
    setState(() {
      difficultyInBreathingChecked = value;
    });
    if (value) {
      addPoint(10);
    } else {
      subtractPoint(10);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pointState = Provider.of<PointState>(context, listen: false);
  }

  @override
  void dispose() {
    if (_pointGot >= _maxPoint) {
      _pointGot = _maxPoint;
    }
    pointState.addPoint(_pointGot);
    print("$_pointGot is added to Pointstate");
    print("Total point is now ${pointState.point}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              onChanged: _changeHeadacheChecked,
              value: headache,
              title: Text("HEADACHE"),
            ),
            CheckboxListTile(
              onChanged: changeFeverChecked,
              value: fever,
              title: Text("FEVER"),
            ),
            CheckboxListTile(
              onChanged: changeTiredChecked,
              value: tiredChecked,
              title: Text("TIREDNESS"),
            ),
            CheckboxListTile(
              onChanged: changeDryCoughChecked,
              value: dryCoughChecked,
              title: Text("DRY COUGH"),
            ),
            CheckboxListTile(
              onChanged: _changeDifficultyInBreathingCheckedChecked,
              value: difficultyInBreathingChecked,
              title: Text("DIFFICULTY IN BREATHING"),
            ),
          ],
        ),
      ),
    );
  }
}
