import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/common/common_widgets.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {

    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return  Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: Icon(Icons.check_box_outline_blank,color: AppColors.borderColor),
        ),
        SizedBox(width: 10,),
        RichText(
            text: TextSpan(
                style: bodyMedium?.copyWith(color: AppColors.black,fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                      text: "By checking this box, I confirm that I have read, understand and agree to the "
                  ),
                  TextSpan(
                    text: "Terms and Conditions",
                    style: bodyMedium?.copyWith(color: AppColors.primaryColor),
                  ),
                  TextSpan(
                      text: " and Privacy Policy"
                  )
                ]
            )
        ),
      ],
    );
  }
}
