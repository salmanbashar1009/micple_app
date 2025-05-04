import 'package:flutter/material.dart';
import 'package:micple_app/core/theme/input_decoration_theme.dart';
import 'package:micple_app/core/theme/text_theme.dart';

import '../constant/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.onPrimaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
      secondary: AppColors.onPrimaryColor,
      onSecondary: AppColors.primaryColor,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.light
  );
}
