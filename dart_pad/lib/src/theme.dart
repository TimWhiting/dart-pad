import 'package:flutter/material.dart';

class DartPadTheme {
  static ThemeData get dartPadTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Color(0xff12202f),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        color: Color(0xff1c2834),
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
