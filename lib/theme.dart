import 'package:covid19selfcheckapp/values/colors.dart';
import 'package:flutter/material.dart';

final ThemeData theme = _buildLightTheme();
ThemeData _buildLightTheme() {
  const Color primaryColor = AppColors.redBackgroundColor;
  const Color secondaryColor = primaryColor;
  const Color whiteColor = AppColors.colorWhite;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: whiteColor,
    toggleableActiveColor: secondaryColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: whiteColor,
    scaffoldBackgroundColor: whiteColor,
    backgroundColor: whiteColor,
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1.copyWith(fontWeight: FontWeight.w500),
        headline6: base.headline6.copyWith(
          fontSize: 20.0,
        ),
        subtitle2: base.subtitle2.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        bodyText2: base.bodyText2.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontSize: 18.0,
          wordSpacing: 2,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      )

      //todo add the theme
      .apply(
        fontFamily: 'SourceSerifPro',
      );
}
