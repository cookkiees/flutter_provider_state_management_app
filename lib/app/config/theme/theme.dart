import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: appBarTheme(),
    cardTheme: cardTheme(),
    elevatedButtonTheme: elevatedButtonTheme(),
    textTheme: textButtonThemeData(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Color(0xFFF5F5F5),
    elevation: 0,
    centerTitle: true,
    surfaceTintColor: Color(0xFFF5F5F5),
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
  );
}

CardTheme cardTheme() {
  return const CardTheme(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 0,
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
  ));
}

TextTheme textButtonThemeData() {
  return const TextTheme(
    displayMedium: TextStyle(color: Colors.white),
    displayLarge: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.black),
    bodySmall: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
    labelSmall: TextStyle(color: Colors.white),
  );
}
