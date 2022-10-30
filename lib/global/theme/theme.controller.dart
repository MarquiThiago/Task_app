import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    cardColor: const Color.fromARGB(255, 229, 188, 236),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.purple,
      splashColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 6,
      backgroundColor: Colors.white,
      indicatorColor: Colors.purple.shade200,
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        onPrimary: Colors.black,
        primary: Color.fromARGB(255, 174, 90, 253),
        secondary: Colors.purple,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black),
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
      button: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
  );

  static final dark = ThemeData(
    chipTheme: const ChipThemeData(backgroundColor: Colors.black26),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
    cardColor: const Color.fromARGB(255, 225, 190, 231),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      hoverColor: Colors.white,
      backgroundColor: Colors.purple,
      splashColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme(
        outline: Colors.white,
        brightness: Brightness.dark,
        onPrimary: Colors.white,
        primary: Colors.deepPurpleAccent,
        secondary: Colors.purple,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.black,
        onBackground: Colors.black,
        surface: Colors.grey,
        onSurface: Colors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.black38,
        indicatorColor: Colors.purple.shade300),
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      button: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
  );
}
