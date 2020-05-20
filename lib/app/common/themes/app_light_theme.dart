import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppLightTheme {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Google',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: mainBlueColor,
      buttonColor: mainBlueColor,
      buttonTheme: ButtonThemeData(
          height: 50,
          minWidth: double.infinity,
          buttonColor: mainBlueColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary),
    );
  }
}
