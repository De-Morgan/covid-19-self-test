import 'package:covid19selfcheckapp/values/values.dart';
import 'package:flutter/material.dart';

class DividerContainer extends StatelessWidget {
  final Widget child;

  const DividerContainer({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: AppColors.redBackgroundColor),
      child: child,
    );
  }
}
