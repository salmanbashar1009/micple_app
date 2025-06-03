// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/core/route_config/route_name.dart';
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
            GestureDetector(
                onTap: (){
                  if(state.selectedItem == 'About us'){
                    Navigator.pushNamed(context, RouteNames.aboutScreen);
                  }else if (state.selectedItem == 'Privacy Policy'){
                    Navigator.pushNamed(context, RouteNames.privacyPolicyScreen);
                  }else if (state.selectedItem == 'Terms & Condition'){
                    Navigator.pushNamed(context, RouteNames.termsConditionPolicy);
                  }else if (state.selectedItem == 'Jobs Policy'){
                    Navigator.pushNamed(context, RouteNames.jobsPolicy);
                  }else if (state.selectedItem == 'Referral Program Policy'){
                    Navigator.pushNamed(context, RouteNames.referralProgramPolicy);
                  }else if(state.selectedItem == 'Campaign Policy'){
                    Navigator.pushNamed(context, RouteNames.campaignPolicy);
                  }
                },
                child: Text(state.selectedItem, style: bodyMedium)),
            MouseRegion(
              onEnter:
                  (_) => context.read<HomeScreenFooterBloc>().add(
                    OnHoverFooterMenuEvent(isHovered: true),
                  ),
              onExit:
                  (_) => context.read<HomeScreenFooterBloc>().add(
                    OnHoverFooterMenuEvent(isHovered: false),
                  ),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        state.isHovered
                            ? AppColors.primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    state.isTapped ? "^" : ">",
                    style: bodyMedium?.copyWith(
                      color:
                          state.isHovered
                              ? AppColors.onPrimaryColor
                              : AppColors.black,
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
                          padding: EdgeInsets.only(
                            bottom: index < state.menuItems.length - 1 ? 5 : 0,
                          ),
                          value: state.menuItems[index],
                          child: HoverableMenuItem(
                            text: state.menuItems[index],
                            bodyMedium: bodyMedium,
                          ),
                          onTap: () {
                            context.read<HomeScreenFooterBloc>().add(
                              SelectedMenuItemEvent(
                                selectedItem: state.menuItems[index],
                              ),
                            );
                            context.read<HomeScreenFooterBloc>().add(
                              CloseMenuEvent(),
                            );

                          },
                        ),
                      ),
                    ).then((value) {
                      context.read<HomeScreenFooterBloc>().add(
                        CloseMenuEvent(),
                      );
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
