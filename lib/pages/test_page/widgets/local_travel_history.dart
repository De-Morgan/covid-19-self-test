import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19selfcheckapp/state/point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'title_label.dart';

class LocalTravelHistoryPage extends StatefulWidget {
  @override
  _LocalTravelHistoryPageState createState() => _LocalTravelHistoryPageState();
}

class _LocalTravelHistoryPageState extends State<LocalTravelHistoryPage> {
  static const int _maxPoint = 5;
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

  bool lagosChecked = false;
  void _changeLagosChecked(bool value) {
    setState(() {
      lagosChecked = value;
    });

    if (value) {
      addPoint(3);
    } else {
      subtractPoint(3);
    }
  }

  bool fctChecked = false;

  void changeFctChecked(bool value) {
    setState(() {
      fctChecked = value;
    });
    if (value) {
      addPoint(2);
    } else {
      subtractPoint(2);
    }
  }

  bool osunChecked = false;

  void changeOsunChecked(bool value) {
    setState(() {
      osunChecked = value;
    });
    if (value) {
      addPoint(2);
    } else {
      subtractPoint(2);
    }
  }

  bool oyoChecked = false;

  void changeOyoChecked(bool value) {
    setState(() {
      oyoChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool edoChecked = false;

  void _changeEdoChecked(bool value) {
    setState(() {
      edoChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool bauchiChecked = false;

  void _changeBauchiChecked(bool value) {
    setState(() {
      bauchiChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool awkaIbomChecked = false;

  void _changeAwkaIbomChecked(bool value) {
    setState(() {
      awkaIbomChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool ogunChecked = false;

  void changeOgunChecked(bool value) {
    setState(() {
      ogunChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool kadunaChecked = false;

  void changeKaduanChecked(bool value) {
    setState(() {
      kadunaChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool enuguChecked = false;

  void changeEnuguChecked(bool value) {
    setState(() {
      enuguChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool ekitiChecked = false;

  void changeEkitiChecked(bool value) {
    setState(() {
      ekitiChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool rivers = false;

  void changeRiversChecked(bool value) {
    setState(() {
      rivers = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool benueChecked = false;

  void changeBenueChecked(bool value) {
    setState(() {
      benueChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool ondoChecked = false;

  void changeOndoChecked(bool value) {
    setState(() {
      ondoChecked = value;
    });
    if (value) {
      addPoint(1);
    } else {
      subtractPoint(1);
    }
  }

  bool othersChecked = false;

  void changeOthersChecked(bool value) {
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
            TitleLabel(title: "LOCAL"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    onChanged: _changeLagosChecked,
                    value: lagosChecked,
                    title: AutoSizeText(
                      "LAGOS",
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeFctChecked,
                    value: fctChecked,
                    title: AutoSizeText("FCT"),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeOsunChecked,
                    value: osunChecked,
                    title: AutoSizeText(
                      "OSUN",
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeOyoChecked,
                    value: oyoChecked,
                    title: AutoSizeText("OYO"),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeOgunChecked,
                    value: ogunChecked,
                    title: AutoSizeText(
                      "OGUN",
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: _changeEdoChecked,
                    value: edoChecked,
                    title: AutoSizeText("EDO"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    onChanged: _changeBauchiChecked,
                    value: bauchiChecked,
                    title: AutoSizeText(
                      "BAUCHI",
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeKaduanChecked,
                    value: kadunaChecked,
                    title: AutoSizeText(
                      "KADUNA",
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeEnuguChecked,
                    value: enuguChecked,
                    title: AutoSizeText(
                      "ENUGU",
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeEkitiChecked,
                    value: ekitiChecked,
                    title: AutoSizeText(
                      "EKITI",
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeRiversChecked,
                    value: rivers,
                    title: AutoSizeText(
                      "RIVERS",
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeBenueChecked,
                    value: benueChecked,
                    title: AutoSizeText(
                      "BENUE",
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeOndoChecked,
                    value: ondoChecked,
                    title: AutoSizeText(
                      "ONDO",
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: _changeAwkaIbomChecked,
                    value: awkaIbomChecked,
                    title: AutoSizeText(
                      "AKWA IBOM",
                      maxLines: 2,
                      minFontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: changeOthersChecked,
                    value: othersChecked,
                    title: AutoSizeText(
                      "OTHERS",
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
