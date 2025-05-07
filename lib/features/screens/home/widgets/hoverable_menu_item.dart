import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/bloc/home/home_screen_footer/home_screen_footer_bloc.dart';
import 'package:micple_app/features/bloc/home/home_screen_footer/home_screen_footer_state.dart';

import '../../../bloc/home/home_screen_footer/home_screen_footer_event.dart';

class HoverableMenuItem extends StatelessWidget {
  final String text;
  final TextStyle? bodyMedium;

  const HoverableMenuItem({required this.text, this.bodyMedium});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenFooterBloc,HomeScreenFooterState>(
      builder: (context,state) {
        return MouseRegion(
          onEnter: (_) {
            context.read<HomeScreenFooterBloc>().add(OnHoverEvent(isHover: text));
            debugPrint("\nOn Enter: hover status : ${state.hoveredValue}\n");
          },
          onExit: (_) {
        context.read<HomeScreenFooterBloc>().add(OnHoverEvent(isHover: ''));
        debugPrint("\nOn Exit: hover status : ${state.hoveredValue}\n");
          },
          child: Container(
            width: double.infinity,
            padding: AppPadding.paddingAll,
            decoration: BoxDecoration(
              color: state.hoveredValue == text ? AppColors.primaryColor : AppColors.borderColor,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: state.hoveredValue == text ? AppColors.onPrimaryColor : AppColors.black),
            ),
          ),
        );
      }
    );
  }
}