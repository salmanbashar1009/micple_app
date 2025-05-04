import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_event.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';

class CustomToolTip extends StatefulWidget {
  const CustomToolTip({
    super.key, required this.message,  required this.fieldKey,
  });

  final String message;
  final String fieldKey;

  @override
  State<CustomToolTip> createState() => _CustomToolTipState();
}

class _CustomToolTipState extends State<CustomToolTip> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc,SignupState>(
      builder: (context,state) {

        final isHover = state.hoverMap[widget.fieldKey] ?? false;

        return MouseRegion(
          onEnter: (_){
            context.read<SignupBloc>().add(
              OnHoverToolTipEvent(fieldKey: widget.fieldKey, isHover: true),
            );
          },
          onExit: (_){
            context.read<SignupBloc>().add(
              OnHoverToolTipEvent(fieldKey: widget.fieldKey, isHover: false),
            );
          },
          child: Tooltip(
            padding: AppPadding.paddingAll,
            verticalOffset: 14,
            preferBelow: false,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.borderColor, // light shadow
                    blurRadius: 8, // how soft the shadow is
                    offset: Offset(0, 1), // X: right/left, Y: down/up
                  ),
                ]
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium,
            // margin: EdgeInsets.only(right: 255),
            message: widget.message,
            child: Icon(Icons.info_outline, color: isHover ? AppColors.primaryColor : AppColors.borderColor),
          ),
        );
      }
    );
  }
}
