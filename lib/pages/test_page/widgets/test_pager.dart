import 'package:covid19selfcheckapp/pages/check_result/check_result_page.dart';
import 'package:covid19selfcheckapp/shared/widgets/divider_container.dart';
import 'package:covid19selfcheckapp/values/style.dart';
import 'package:covid19selfcheckapp/values/values.dart';
import 'package:flutter/material.dart';

import 'contact_with_infected_person.dart';
import 'foreign_travel_history_page.dart';
import 'local_travel_history.dart';
import 'symptoms.dart';

class TestPagerWidget extends StatefulWidget {
  @override
  _TestPagerWidgetState createState() => _TestPagerWidgetState();
}

class _TestPagerWidgetState extends State<TestPagerWidget> {
  final _titles = <String>[
    "TRAVEL HISTORY SINCE THE LAST TWO MONTHS",
    "TRAVEL HISTORY SINCE THE LAST TWO MONTHS",
    "HAVE YOU IN CONTACT WITH AN INFECTED PERSON",
    "SYMPTOMS"
  ];

  String _title;

  PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _title = _titles[0];
    _pageController = PageController();
  }

  void changeTitle(int pageIndex) {
    setState(() {
      _title = _titles[pageIndex];
      _pageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DividerContainer(
            child: Text(
              "$_title",
              textAlign: TextAlign.center,
              style: travelHistoryStyle,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: changeTitle,
              children: <Widget>[
                ForeignTravelHistoryPage(key: Key("ForeignTravelHistoryPage")),
                LocalTravelHistoryPage(),
                ContactWithInfectedPerson(),
                SymptomsWidget()
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Disabled back scrolling because of login error
              /*  _pageIndex == 0
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                    ),*/
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  if (_pageIndex == 3) {
                    Navigator.pushReplacementNamed(
                        context, CheckResultPage.routeName);
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
