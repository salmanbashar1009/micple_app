import 'package:flutter/cupertino.dart';
import 'package:micple_app/core/route_config/route_name.dart';
import 'package:micple_app/features/screens/about/about_screen.dart';
import 'package:micple_app/features/screens/home/home_screen.dart';
import 'package:micple_app/features/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:micple_app/features/screens/signup/signup_screen.dart';

import '../../features/screens/campaign/campaign_screen.dart';
import '../../features/screens/jobs_policy/job_policy_screen.dart';
import '../../features/screens/referral_program/referral_program_screen.dart';
import '../../features/screens/terms_condition/terms_condition_screen.dart';

class AppRoutes{
 static Map<String, Widget Function(BuildContext)> generateRoutes = {
   RouteNames.signinScreen : (BuildContext context) => const HomeScreen(),
   RouteNames.signupScreen : (BuildContext context) => const SignupScreen(),
   RouteNames.aboutScreen : (BuildContext context) => const AboutScreen(),
   RouteNames.privacyPolicyScreen : (BuildContext context) => const PrivacyPolicyScreen(),
   RouteNames.termsConditionPolicy : (BuildContext context) => const TermsConditionScreen(),
   RouteNames.jobsPolicy : (BuildContext context) => const JobsPolicyScreen(),
   RouteNames.referralProgramPolicy : (BuildContext context) => const ReferralProgramPolicyScreen(),
   RouteNames.campaignPolicy : (BuildContext context) => const CampaignPolicyScreen(),
 };
}

