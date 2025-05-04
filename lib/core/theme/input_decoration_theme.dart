import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';

class AppInputDecorationTheme{
  static InputDecorationTheme light = InputDecorationTheme(
    contentPadding: AppPadding.paddingHorizontal,
    hintStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54,fontSize: 14),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(5)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5)
    ),
  );
}