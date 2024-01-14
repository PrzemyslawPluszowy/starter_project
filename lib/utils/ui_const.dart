import 'package:flutter/material.dart';

class Ui {
  // Paddings and Margins
  static const double p4 = 4;
  static const double p8 = 8;
  static const double p12 = 12;
  static const double p16 = 16;
  static const double p20 = 20;
  static const double p40 = 44;

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
  static const double fontSize28 = 28;
  static const double fontSize32 = 32;
  static const double fontSize36 = 36;
//avatar radius
  static const double avatarRadius = 45;
  //border radius
  static const double borderRadius8 = 8;
  static const double borderRadius12 = 12;
//animate duration
  static const Duration animateDuration300 = Duration(milliseconds: 300);
  static const Duration animateDuration500 = Duration(milliseconds: 500);
  static const Duration animateDuration1000 = Duration(milliseconds: 1000);

  //box shadow
  static const List<BoxShadow> blackBoxShadow = [
    BoxShadow(
      color: Color.fromARGB(176, 0, 0, 0),
      blurRadius: 4,
      offset: Offset(3, 3),
    )
  ];

  static const List<BoxShadow> lightBoxShadow = [
    BoxShadow(
      color: Color.fromARGB(225, 37, 37, 37),
      blurRadius: 10,
      offset: Offset(3, 3),
    )
  ];
  //text styles
  static const TextStyle condensateLabelMedium = TextStyle(
    fontSize: fontSize24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const TextStyle condensateLabelMediumWhite = TextStyle(
    fontSize: fontSize24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    color: Colors.white,
  );
  static const TextStyle labelWhiteSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const TextStyle labelWhiteMedium = TextStyle(
    fontSize: fontSize16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
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

  // iconTheme: const IconThemeData(color: Colors.white),
  static const IconThemeData iconThemeData =
      IconThemeData(color: Colors.white, size: 24);
}
