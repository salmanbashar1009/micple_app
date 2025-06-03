import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/data/date_data.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';
import 'package:micple_app/features/screens/signup/widgets/dash_border_painter.dart';

import '../../../bloc/signup/signup_bloc.dart';
import '../../../bloc/signup/signup_event.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({super.key, this.onChanged, this.enabled});

  final Function(String?)? onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Colors.black,
    );

    return Theme(
      data: Theme.of(context).copyWith(hoverColor: AppColors.primaryColor),
      child: SizedBox(
        height: 40,
        child: CustomPaint(
          painter: DashedBorderPainter(color: AppColors.borderColor),
          child: DropdownButtonFormField<String>(
            itemHeight: null,
            elevation: 2,
            alignment: Alignment.centerLeft,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: const InputDecoration(
              contentPadding: AppPadding.paddingHorizontal,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
            hint: Text("Gender", style: bodyMedium?.copyWith(color: Colors.black45)),
            dropdownColor: AppColors.white,
            onChanged: onChanged,
            // enableFeedback: enabled,
            selectedItemBuilder: (context) => genders.map((gender) => Text(gender, style: bodyMedium))
                .toList(),
            items: genders.map((gender) {
              return DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: gender,
                child: MouseRegion(
                  onEnter: (_) {
                    debugPrint('Hover enter: $gender');
                    context.read<SignupBloc>().add(OnHoverEvent(value: gender));
                  },
                  onExit: (_) {
                    debugPrint('Hover exit: $gender');
                    context.read<SignupBloc>().add(OnHoverEvent(value: " "));
                  },
                  child: BlocBuilder<SignupBloc, SignupState>(
                    builder: (context,state) {
                      return Container(
                        width: double.infinity,
                        height: 35,
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: Text(
                          gender,
                          textAlign: TextAlign.center,
                          style: bodyMedium?.copyWith(
                            color: state.hoveredValue == gender ? AppColors.white : Colors.black,
                          ),
                        ),
                      );
                    }
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}