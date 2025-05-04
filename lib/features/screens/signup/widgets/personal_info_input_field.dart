import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/screens/signup/widgets/custom_date_picker.dart';
import 'package:micple_app/features/screens/signup/widgets/dash_border_text_field.dart';
import 'package:micple_app/features/screens/signup/widgets/gender_picker.dart';

import 'custom_tooltip.dart';

class PersonalInfoInputField extends StatelessWidget {
  const PersonalInfoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Personal Information", style: bodyMedium),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: DashedBorderTextFormField(
                fieldKey: "first_name",
                hintText: "First Name",
                suffixIcon: CustomToolTip(message: "First name used in your government-issued ID, written in English characters.\nIn case your name do contain digits, type digits in words",fieldKey: "first_name",),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: DashedBorderTextFormField(
                fieldKey: "last_name",
                hintText: "Last Name",
                suffixIcon: CustomToolTip(message: "Last name used in your government-issued ID, written in English characters.\nIn case your name do contain digits, type digits in words",fieldKey: "last_name",),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: DashedBorderTextFormField(fieldKey: "father_name",hintText: "Father Name")),
            SizedBox(width: 20),
            Expanded(child: DashedBorderTextFormField(fieldKey: "mother_name", hintText: "Mother Name")),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Expanded(child: CustomDatePicker()),
            SizedBox(width: 20,),
            Expanded(child: GenderPicker()),
          ],
        ),
      ],
    );
  }
}

