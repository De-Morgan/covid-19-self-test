import 'package:flutter/rendering.dart';

import 'colors.dart';

class AppDecoration {
  static const BoxDecoration covidBackgroundDecoration = BoxDecoration(
      color: AppColors.onBoardBackground,
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background_image.png")));

  static BoxDecoration textBackgroundDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppColors.redBackgroundColor,
  );
}
