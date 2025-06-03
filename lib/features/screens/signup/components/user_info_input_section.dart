import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/screens/signup/components/password_row.dart';
import 'package:micple_app/features/screens/signup/components/username_and_nid_row.dart';
import 'package:micple_app/features/screens/signup/widgets/terms_and_condition.dart';
import 'country_and_phone_row.dart';

class UserInfoInputSection extends StatelessWidget {
  const UserInfoInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(fontSize: 15, fontWeight: FontWeight.w500);

    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User Information", style: bodyMedium),
        Text(
          "Your username must be small letter and underscore_ then your favorite numbers.",
          style: bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

        /// username and NID input section
        UsernameAndNidRow(),

        /// country and phone input section
        CountryAndPhoneRow(bodyMedium: bodyMedium),

        Text(
          "Your password must be 8 within 12 digit, if you use * uppercase.number @ lowercase # (in this case your password will be more strong)",
          style: bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

        /// password input section
        PasswordRow(),

        Divider(color: AppColors.borderColor, height: 20, thickness: 5),
        TermsAndCondition(),
      ],
    );
  }
}
