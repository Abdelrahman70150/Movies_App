import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/styles/const/constant.dart';

class MyThemeData {
  static ThemeData myLightTheme =ThemeData(

  );

  static ThemeData myDarkTheme=ThemeData(
    scaffoldBackgroundColor: myMainDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bottomNavColor,
      selectedItemColor: selectedBottomNavItemColor,
      unselectedItemColor: unSelectedBottomNavItemColor,
      type: BottomNavigationBarType.fixed
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: myMainDarkColor,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.aBeeZee(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.arvo(
        color: Colors.grey,
        fontSize: 10,
      ),
    ),
  );
}