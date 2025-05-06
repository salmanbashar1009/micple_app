import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';

import 'hoverable_menu_item.dart';

class ShowPopupMenu extends StatelessWidget {
  const ShowPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final topPositon = MediaQuery.of(context).size.height * 0.7 - 60;

    return Wrap(
      spacing: 4,
      children: [
        GestureDetector(
          child: Text(
            "About us",
            style: bodyMedium,
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              ">",
              style: bodyMedium?.copyWith(color: AppColors.onPrimaryColor),
            ),
          ),
          onTap: () {
            showMenu(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: AppColors.borderColor),
              ),
              shadowColor: Colors.transparent,
              elevation: 0,
              position: RelativeRect.fromLTRB(100, topPositon, 0, 0),
              constraints: BoxConstraints(maxWidth: 170),
              surfaceTintColor: Colors.transparent,
              menuPadding: AppPadding.paddingAll,
              items: [
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(bottom: 10), // 10px gap between items
                  value: 'About us',
                  child: HoverableMenuItem(
                    text: 'About us',
                    bodyMedium: bodyMedium,
                  ),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(bottom: 10), // 10px gap between items
                  value: 'Privacy Policy',
                  child: HoverableMenuItem(
                    text: 'Privacy Policy',
                    bodyMedium: bodyMedium,
                  ),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(bottom: 10), // 10px gap between items
                  value: 'Terms & Condition',
                  child: HoverableMenuItem(
                    text: 'Terms & Condition',
                    bodyMedium: bodyMedium,
                  ),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(bottom: 10), // 10px gap between items
                  value: 'Jobs Policy',
                  child: HoverableMenuItem(
                    text: 'Jobs Policy',
                    bodyMedium: bodyMedium,
                  ),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(bottom: 10), // 10px gap between items
                  value: 'Referral Program Policy',
                  child: HoverableMenuItem(
                    text: 'Referral Program Policy',
                    bodyMedium: bodyMedium,
                  ),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.zero, // Last item, no bottom padding
                  value: 'Campaign Policy',
                  child: HoverableMenuItem(
                    text: 'Campaign Policy',
                    bodyMedium: bodyMedium,
                  ),
                ),
              ],
            ).then((value) {
              if (value != null) debugPrint('Selected: $value');
            });
          },
        ),
      ],
    );
  }
}

