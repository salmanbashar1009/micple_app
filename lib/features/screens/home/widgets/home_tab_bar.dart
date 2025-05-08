import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_padding.dart';
import '../../../bloc/home/home_screen_body/home_screen_body_bloc.dart';
import '../../../bloc/home/home_screen_body/home_screen_body_event.dart';
import '../../../bloc/home/home_screen_body/home_screen_body_state.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Container(
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        reverse: true,
        physics: const BouncingScrollPhysics(), // Optional: for smoother scrolling
        child: BlocBuilder<HomeScreenBodyBloc, HomeScreenBodyState>(
          builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(state.tabs.length * 2 - 1, (i) {
                if (i.isOdd) {
                  return VerticalDivider(
                    indent: 8,
                    endIndent: 8,
                    color: AppColors.borderColor,
                    width: 1,
                  );
                }
                final index = i ~/ 2;
                final isSelected = index == state.selectedIndex;
                return GestureDetector(
                  onTap: () => context
                      .read<HomeScreenBodyBloc>()
                      .add(TabChanged(index)),
                  child: Container(
                    padding: AppPadding.paddingHorizontal,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      state.tabs[index],
                      style: bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}