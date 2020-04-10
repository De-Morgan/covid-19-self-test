import 'package:flutter/material.dart';

class FadedBackgroundContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Opacity(
        opacity: 0.1,
        child: Container(
          width: double.infinity,
          child: Image.asset(
            "assets/images/covid_image.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
