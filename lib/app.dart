import 'package:flutter/material.dart';
import 'package:micple_app/core/route_config/app_routes.dart';
import 'package:micple_app/core/route_config/route_name.dart';
import 'package:micple_app/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Micple Inc",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      initialRoute: RouteNames.signinScreen,
      routes: AppRoutes.generateRoutes,
    );
  }
}
