import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/font_app.dart';
import 'package:se7ety/core/styles/colors.dart';
import 'package:se7ety/core/styles/text.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.cairo,
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      elevation: 0,
      centerTitle: true,
      foregroundColor: AppColor.whiteColor,
      titleTextStyle: TextStyle(
        fontFamily: AppFonts.cairo,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      surfaceTintColor: Colors.transparent,
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColor.borderColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(60, 30),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.body.copyWith(color: AppColor.greyColor),
      fillColor: AppColor.accentColor,
      filled: true,
      prefixIconColor: AppColor.primaryColor,
      suffixIconColor: AppColor.primaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.greyColor,
      backgroundColor: Colors.transparent,
      selectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      onSurface: AppColor.darkColor,
    ),
  );
}