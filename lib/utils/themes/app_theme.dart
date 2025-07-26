import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/utils/themes/color.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.ibmPlexSansThai().fontFamily,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14),
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: AppColors.whiteColor,
    backgroundColor: AppColors.whiteColor,
    foregroundColor: AppColors.primaryTextColor,
    elevation: 4,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.ibmPlexSansThai().fontFamily,
      color: AppColors.primaryTextColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.greyColor.withValues(alpha: 0.5),
        width: 1.0,
      ),
    ),
    prefixIconColor: AppColors.greyColor,
    filled: false,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 20.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.whiteColor,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.greyColor,
    selectedLabelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTextColor,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.greyColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      disabledBackgroundColor: AppColors.greyColor.withValues(alpha: 0.5),
      disabledForegroundColor: AppColors.whiteColor.withValues(alpha: 0.7),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      disabledForegroundColor: AppColors.greyColor.withValues(alpha: 0.7),
      side: BorderSide(color: AppColors.primaryColor, width: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
);
