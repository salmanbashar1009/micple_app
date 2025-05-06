import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/common/common_widgets.dart';

import '../widgets/show_popup_menu.dart';

class HomeScreenFooter extends StatelessWidget {
  const HomeScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      color: Color(0xFFe4e4e4),
      child: Row(
        children: [
          Text("Dhaka,Bangladesh", style: bodyMedium),
          Spacer(),
          Text("©Micple™", style: bodyMedium),
          Spacer(),
          ShowPopupMenu()
        ],
      ),
    );
  }
}
