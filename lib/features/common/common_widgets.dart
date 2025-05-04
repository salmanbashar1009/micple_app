import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';

class CommonWidgets {
  static Widget primaryButton({required VoidCallback onTap}) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          "Sign in",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.onPrimaryColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  static Widget backButton ({required BuildContext context}){
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }

  static Widget appLogo({required VoidCallback onTap, double? width}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "assets/images/micple-logo.png",
        fit: BoxFit.contain,
        width: width,
        height: 75,
      ),
    );
  }
}
