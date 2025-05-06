import 'package:flutter/cupertino.dart';
import 'package:micple_app/core/route_config/route_name.dart';
import 'package:micple_app/features/screens/home/home_screen.dart';
import 'package:micple_app/features/screens/signup/signup_screen.dart';

class AppRoutes{
 static Map<String, Widget Function(BuildContext)> generateRoutes = {
   RouteNames.signinScreen : (BuildContext context) => const HomeScreen(),
   RouteNames.signupScreen : (BuildContext context) => const SignupScreen(),
 };
}