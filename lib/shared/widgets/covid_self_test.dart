import 'package:covid19selfcheckapp/values/style.dart';
import 'package:flutter/material.dart';

class CovidSelfTestWidget extends StatefulWidget {
  @override
  _CovidSelfTestWidgetState createState() => _CovidSelfTestWidgetState();
}

class _CovidSelfTestWidgetState extends State<CovidSelfTestWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut));
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
      if (_animationController.isDismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void deactivate() {
    super.deactivate();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Hero(
            tag: "COVID-IMAGE",
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (BuildContext context, Widget child) {
                return Transform.scale(
                    scale: _scaleAnimation.value, child: child);
              },
              child: Container(
                  alignment: FractionalOffset.center,
                  child: Image.asset("assets/images/covid_image.png")),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 17),
            child: Text(
              "COVID-19",
              style: covid19TextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              "SELF TEST",
              textAlign: TextAlign.left,
              style: selfTest,
            ),
          ),
        ],
      ),
    );
  }
}
