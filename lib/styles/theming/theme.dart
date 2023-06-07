import 'package:flutter/material.dart';
import 'package:movies/styles/const/constant.dart';

class MyThemeData {
  static ThemeData myLightTheme =ThemeData(

  );

  static ThemeData myDarkTheme=ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bottomNavColor,
      selectedItemColor: selectedBottomNavItemColor,
      unselectedItemColor: unSelectedBottomNavItemColor,
    )
  );
}