import 'package:covid19selfcheckapp/values/app_decoration.dart';
import 'package:covid19selfcheckapp/values/colors.dart';
import 'package:covid19selfcheckapp/values/style.dart';
import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  final String title;
  const TitleLabel({Key key, this.title = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 124,
      alignment: Alignment.center,
      decoration: AppDecoration.textBackgroundDecoration,
      child: Text(
        title,
        style: titleLabelTextStyle,
      ),
    );
  }
}
