import 'package:flutter/material.dart';
import 'package:micple_app/features/common/common_widgets.dart';
import '../widgets/home_body_content.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_tab_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.bodyMedium});

  final TextStyle? bodyMedium;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.appLogo(
            onTap: () {
              /// navigate to home screen
            },
          ),
          HomeSearchBar(),
          // Wrap HomeTabBar to ensure it can handle horizontal scrolling
          HomeTabBar(),
          HomeBodyContent(),
        ],
      ),
    );
  }
}