import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/common/common_widgets.dart';
import 'package:micple_app/features/screens/signup/widgets/custom_tooltip.dart';
import 'package:micple_app/features/screens/signup/widgets/terms_and_condition.dart';
import 'package:micple_app/features/screens/signup/widgets/user_name_container.dart';
import 'dash_border_painter.dart';
import 'dash_border_text_field.dart';

class UserInfoInputField extends StatelessWidget {
  const UserInfoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Personal Information", style: bodyMedium),
        const SizedBox(height: 10),
        Text(
          "Your username must be small letter and underscore_ then your favorite numbers.",
          style: bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: UsernameContainer()),
            const SizedBox(width: 20),
            Expanded(
              child: DashedBorderTextFormField(
                hintText: 'Enter your national ID/SSN Number',
                fieldKey: 'nid',
                suffixIcon: CustomToolTip(
                  message: "NID number used in your government-issued ID, written in English characters and digits",
                  fieldKey: "nid",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: DashedBorderTextFormField(hintText: 'Bangladesh', readOnly: true)),
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                children: [
                  Container(
                    // ignore: deprecated_member_use
                    color: AppColors.borderColor.withOpacity(0.1),
                    height: 50,
                    width: 100,
                    child: CustomPaint(
                      painter: DashedBorderPainter(isDotted: true, color: AppColors.borderColor, widthDash: 5),
                      child: Center(child: Text("+880", style: bodyMedium?.copyWith(color: Colors.black87))),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: DashedBorderTextFormField(hintText: '123 456 789', fieldKey: "phone_number")),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Your password must be 8 within 12 digit, if you use * uppercase.number @ lowercase # (in this case your password will be more strong)",
          style: bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: DashedBorderTextFormField(fieldKey: "new_password", hintText: "New Password")),
            const SizedBox(width: 20),
            Expanded(child: DashedBorderTextFormField(fieldKey: "confirm_password", hintText: "Confirm Password")),
          ],
        ),
        const SizedBox(height: 10),
        Divider(color: AppColors.borderColor, height: 10, thickness: 5),
        const SizedBox(height: 10),
        TermsAndCondition(),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: CommonWidgets.primaryButton(onTap: () {}, title: "Submit", height: 35),
        ),
      ],
    );
  }
}