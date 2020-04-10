import 'package:covid19selfcheckapp/state/point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'title_label.dart';

class ForeignTravelHistoryPage extends StatefulWidget {
  ForeignTravelHistoryPage({Key key}) : super(key: key);
  @override
  _ForeignTravelHistoryPageState createState() =>
      _ForeignTravelHistoryPageState();
}

class _ForeignTravelHistoryPageState extends State<ForeignTravelHistoryPage> {
  static const int _maxPoint = 10;
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

  bool chinaChecked = false;
  void _changeChinaChecked(bool value) {
    setState(() {
      chinaChecked = value;
    });

    if (value) {
      addPoint(5);
    } else {
      subtractPoint(5);
    }
  }

  bool spainChecked = false;

  void changeSpainChecked(bool value) {
    setState(() {
      spainChecked = value;
    });
    if (value) {
      addPoint(4);
    } else {
      subtractPoint(4);
    }
  }

  bool usaChecked = false;

  void changeUSAChecked(bool value) {
    setState(() {
      usaChecked = value;
    });
    if (value) {
      addPoint(5);
    } else {
      subtractPoint(5);
    }
  }

  bool italyChecked = false;

  void changeItalyChecked(bool value) {
    setState(() {
      italyChecked = value;
    });
    if (value) {
      addPoint(4);
    } else {
      subtractPoint(4);
    }
  }

  bool franceChecked = false;

  void _changeFranceChecked(bool value) {
    setState(() {
      franceChecked = value;
    });
    if (value) {
      addPoint(3);
    } else {
      subtractPoint(3);
    }
  }

  bool ukChecked = false;

  void _changeUKChecked(bool value) {
    setState(() {
      ukChecked = value;
    });
    if (value) {
      addPoint(3);
    } else {
      subtractPoint(3);
    }
  }

  bool germanyChecked = false;

  void _changeGermanyChecked(bool value) {
    setState(() {
      germanyChecked = value;
    });
    if (value) {
      addPoint(3);
    } else {
      subtractPoint(3);
    }
  }

  bool othersChecked = false;

  void _changeOthersChecked(bool value) {
    setState(() {
      othersChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TitleLabel(title: "FOREIGN"),
            SizedBox(
              height: 12,
            ),
            CheckboxListTile(
              key: ValueKey("CHINA"),
              onChanged: _changeChinaChecked,
              value: chinaChecked,
              title: Text("CHINA"),
            ),
            CheckboxListTile(
              onChanged: changeSpainChecked,
              value: spainChecked,
              title: Text("SPAIN"),
            ),
            CheckboxListTile(
              onChanged: changeUSAChecked,
              value: usaChecked,
              title: Text("USA"),
            ),
            CheckboxListTile(
              onChanged: changeItalyChecked,
              value: italyChecked,
              title: Text("ITALY"),
            ),
            CheckboxListTile(
              onChanged: _changeFranceChecked,
              value: franceChecked,
              title: Text("FRANCE"),
            ),
            CheckboxListTile(
              onChanged: _changeUKChecked,
              value: ukChecked,
              title: Text("UK"),
            ),
            CheckboxListTile(
              onChanged: _changeGermanyChecked,
              value: germanyChecked,
              title: Text("GERMANY"),
            ),
            CheckboxListTile(
              onChanged: _changeOthersChecked,
              value: othersChecked,
              title: Text("OTHERS"),
            ),
          ],
        ),
      ),
    );
  }
}
