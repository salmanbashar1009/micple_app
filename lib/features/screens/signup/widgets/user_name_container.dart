import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/screens/signup/widgets/dash_border_text_field.dart';
import 'dash_border_painter.dart';

class UsernameContainer extends StatelessWidget {
  const UsernameContainer({super.key});

  @override
  Widget build(BuildContext context) {

    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800,color: AppColors.black);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Expanded(child: DashedBorderTextFormField(hintText: "user_123", readOnly: true,)),
          CustomPaint(
            painter: DashedBorderPainter(isDotted: true,color: AppColors.borderColor,widthDash: 5),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 20,
                  child: Container(
                    color: AppColors.borderColor,
                    child: Center(child: Text('@',style: bodyMedium,)),
                  )
                ),
                SizedBox(width: 10,),
                SizedBox(
                  child: Text("micple.com",style: bodyMedium,),
                ),
                SizedBox(width: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
