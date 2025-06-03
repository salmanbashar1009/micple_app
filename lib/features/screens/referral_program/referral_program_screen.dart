import 'package:flutter/material.dart';
import 'package:micple_app/core/app_strings/referral_program_policy_strings.dart';
import 'package:micple_app/core/constant/app_colors.dart';

class ReferralProgramPolicyScreen extends StatelessWidget {
  const ReferralProgramPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Referral Program Policy"),
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
              child: Text(ReferralProgramPolicy.referralProgramPolicyText,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),),
            )),
          ),
        ),
      ),
    );
  }
}
