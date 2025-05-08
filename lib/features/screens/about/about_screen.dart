import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/common/common_widgets.dart';

import '../../../core/app_strings/about_strings.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CommonWidgets.backButton(context: context),
        title: const Text("About Us"),
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
              child: Text(About.aboutText,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),),
            )),
          ),
        ),
      ),
    );
  }
}
