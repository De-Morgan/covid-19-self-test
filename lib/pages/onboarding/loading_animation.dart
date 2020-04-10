import 'package:covid19selfcheckapp/values/colors.dart';
import 'package:flutter/material.dart';

class LoadindDots extends StatefulWidget {
  @override
  _LoadindDotsState createState() => _LoadindDotsState();
}

class _LoadindDotsState extends State<LoadindDots>
    with SingleTickerProviderStateMixin {
  AnimationController _animatedContainer;
  Animation _firstDot;
  Animation _secondDot;
  Animation _thirdDot;

  @override
  void initState() {
    super.initState();
    _animatedContainer =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _firstDot = Tween(
      begin: 1.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _animatedContainer, curve: Interval(0.1, 0.3)));
    _secondDot = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animatedContainer, curve: Interval(0.3, 0.6)));
    _thirdDot = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animatedContainer, curve: Interval(0.6, 1.0)));

    _animatedContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Spacer(
            flex: 4,
          ),
          FadeTransition(
            opacity: _firstDot,
            child: Dot(),
          ),
          Spacer(),
          FadeTransition(
            opacity: _secondDot,
            child: Dot(
              color: AppColors.secondDotColor,
            ),
          ),
          Spacer(),
          FadeTransition(
            opacity: _thirdDot,
            child: Dot(
              color: AppColors.thirdDotColor,
            ),
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;
  const Dot({Key key, this.color = AppColors.firstDotColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21,
      height: 21,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
