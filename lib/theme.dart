import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klasha/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: backgroundColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: const Color(0XFF8B8B8B), fontSize: 18),
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: textBig, fontSize: 28, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: textMedium, fontSize: 18, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: textSmall, fontSize: 14, fontWeight: FontWeight.normal),
  );
}
