import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/screens/signin/widgets/footer.dart';
import 'package:micple_app/features/screens/signin/widgets/header.dart';
import 'package:micple_app/features/screens/signin/widgets/main_body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// text style
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
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
                    Header(),
                    MainBody(bodyMedium: bodyMedium),
                  ],
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
