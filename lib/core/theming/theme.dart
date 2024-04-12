import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/core/theming/colors.dart';
import 'package:notes_app/core/theming/font_weight_helper.dart';

abstract class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsManager.darkPurple,
      primaryColor: ColorsManager.purple,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: ColorsManager.darkPurple,
        iconTheme: IconThemeData(color: ColorsManager.white),
        titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeightHelper.bold,
            color: ColorsManager.white,
            fontFamily: 'Montserrat'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorsManager.darkPurple,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light),
      ),
    );
  }
}
