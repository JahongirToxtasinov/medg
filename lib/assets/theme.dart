import 'package:flutter/material.dart';
import 'package:medg/assets/colors.dart';

class AppTheme {
  static darkTheme() => ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: blueText,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: onBoardText,
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: white,
      ),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: darkBlueText,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: darkBlueText,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: greyText,
      ),
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: darkBlueText,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: greyText,
      ),
    ),

    fontFamily: 'Barlow',
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: appBarTextColor,fontSize: 16,fontWeight: FontWeight.w600),
        backgroundColor: white,
      shadowColor: greyText,
      surfaceTintColor: white,
      elevation: 2
    ),
  );
}