import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';

import '../../../core/app_strings/terms_condition_strings.dart';
class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Condition"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 980
            ),
            child: SingleChildScrollView(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              child: Center(child: Text(TermsCondition.termsConditionText,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),)),
            )),
          ),
        ),
      ),
    );
  }
}
