import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import '../../../bloc/home/home_screen_footer/home_screen_footer_bloc.dart';
import '../../../bloc/home/home_screen_footer/home_screen_footer_event.dart';
import '../../../bloc/home/home_screen_footer/home_screen_footer_state.dart';
import 'hoverable_menu_item.dart';

class ShowPopupMenu extends StatelessWidget {
  const ShowPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final topPosition = MediaQuery.of(context).size.height * 0.7 - 50;

    return BlocBuilder<HomeScreenFooterBloc, HomeScreenFooterState>(
      builder: (context, state) {
        return Wrap(
          spacing: 5,
          children: [
            GestureDetector(child: Text(state.selectedItem, style: bodyMedium)),
            MouseRegion(
              onEnter: (_) => context.read<HomeScreenFooterBloc>().add(OnHoverFooterMenuEvent(isHovered: true)),
              onExit: (_) => context.read<HomeScreenFooterBloc>().add(OnHoverFooterMenuEvent(isHovered: false)),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: state.isHovered ? AppColors.primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    state.isTapped ? "^" : ">",
                    style: bodyMedium?.copyWith(
                      color: state.isHovered ? AppColors.onPrimaryColor : AppColors.black,
                    ),
                  ),
                ),
                onTap: () {
                  if (!state.isTapped) {
                    context.read<HomeScreenFooterBloc>().add(OpenMenuEvent());
                    showMenu(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: AppColors.borderColor),
                      ),
                      elevation: 0,
                      position: RelativeRect.fromLTRB(100, topPosition, 0, 0),
                      constraints: const BoxConstraints(maxWidth: 165),
                      menuPadding: AppPadding.paddingAll,
                      items: List.generate(
                        state.menuItems.length,
                            (index) => PopupMenuItem<String>(
                          padding: EdgeInsets.only(bottom: index < state.menuItems.length - 1 ? 5 : 0),
                          value: state.menuItems[index],
                          child: GestureDetector(
                            onTap: () {
                              context.read<HomeScreenFooterBloc>().add(SelectedMenuItemEvent(selectedItem: state.menuItems[index]));
                              Navigator.pop(context);
                              context.read<HomeScreenFooterBloc>().add(CloseMenuEvent());
                            },
                            child: HoverableMenuItem(text: state.menuItems[index], bodyMedium: bodyMedium),
                          ),
                        ),
                      ),
                    ).then((value) {
                      context.read<HomeScreenFooterBloc>().add(CloseMenuEvent());
                      if (value != null) debugPrint('Selected: $value');
                    });
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}