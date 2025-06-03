import 'package:flutter/material.dart';

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
          Expanded(child: Text("Dhaka,Bangladesh", style: bodyMedium)),
          Spacer(),
          Expanded(child: Text("©Micple™", style: bodyMedium)),
          Spacer(),
          ShowPopupMenu()
        ],
      ),
    );
  }
}
