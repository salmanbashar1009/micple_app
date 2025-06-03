import 'package:flutter/material.dart';
import 'package:micple_app/core/app_strings/campaign_policy_strings.dart';
import 'package:micple_app/core/constant/app_colors.dart';

import '../../common/common_widgets.dart';
class CampaignPolicyScreen extends StatelessWidget {
  const CampaignPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CommonWidgets.backButton(context: context),
        title: const Text("Campaign Policy"),
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
              child: Text(CampaignPolicy.campaignPolicyText,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),),
            )),
          ),
        ),
      ),
    );
  }
}
