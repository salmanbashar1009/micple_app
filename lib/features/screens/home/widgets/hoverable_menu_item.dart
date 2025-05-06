import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';

class HoverableMenuItem extends StatefulWidget {
  final String text;
  final TextStyle? bodyMedium;

  const HoverableMenuItem({required this.text, this.bodyMedium});

  @override
  _HoverableMenuItemState createState() => _HoverableMenuItemState();
}

class _HoverableMenuItemState extends State<HoverableMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: AppPadding.paddingAll,
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.primaryColor : AppColors.borderColor,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: widget.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}