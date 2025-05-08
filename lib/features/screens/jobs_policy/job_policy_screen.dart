import 'package:flutter/material.dart';
import 'package:micple_app/core/app_strings/jobs_policy_strings.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';

import '../../../core/app_strings/about_strings.dart';
import '../../common/common_widgets.dart';
class JobsPolicyScreen extends StatelessWidget {
  const JobsPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CommonWidgets.backButton(context: context),
        title: const Text("Jobs Policy"),
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
              child: Text(JobsPolicy.jobsPolicyText,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),),
            )),
          ),
        ),
      ),
    );
  }
}
