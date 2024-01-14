import 'package:flutter/material.dart';

class Ui {
  // Paddings and Margins
  static const double p4 = 4;
  static const double p8 = 8;
  static const double p12 = 12;
  static const double p16 = 16;
  static const double p20 = 20;

  //border radius
  static const double radius8 = 8;
  static const double radius12 = 12;
  static const double radius16 = 16;

  //font sizes
  static const double fontSize8 = 8;
  static const double fontSize12 = 12;
  static const double fontSize16 = 16;
  static const double fontSize20 = 20;
  static const double fontSize24 = 24;

  static const double avatarRadius = 45;
}

class UiColors {
  static const green = Colors.green;
  static const yellow = Colors.yellow;
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const lightGrey = Color.fromARGB(255, 245, 245, 245);
  static const red = Colors.red;
  static const darkGrey = Color.fromARGB(255, 37, 37, 37);
}

class CustomTheme {
  static const BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    backgroundColor: UiColors.darkGrey,
    selectedItemColor: UiColors.white,
    unselectedItemColor: UiColors.grey,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(color: UiColors.white, fontSize: 12),
    unselectedLabelStyle: TextStyle(color: UiColors.grey, fontSize: 12),
  );

  static const AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0,
    surfaceTintColor: UiColors.darkGrey,
    foregroundColor: UiColors.darkGrey,
    backgroundColor: UiColors.darkGrey,
    titleTextStyle: TextStyle(color: UiColors.white, fontSize: Ui.fontSize16),
  );
}
