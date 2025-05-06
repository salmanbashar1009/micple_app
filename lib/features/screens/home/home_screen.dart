import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_padding.dart';

import 'components/home_screen_body.dart';
import 'components/home_screen_footer.dart';
import 'components/sign_in_section.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// text style
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: AppPadding.paddingAll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInSection(),
                    HomeScreenBody(bodyMedium: bodyMedium),
                  ],
                ),
              ),
            ),
            HomeScreenFooter(),
          ],
        ),
      ),
    );
  }
}
