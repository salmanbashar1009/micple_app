import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';
import 'package:micple_app/features/screens/signup/widgets/dash_border_painter.dart';

import '../../../bloc/signup/signup_bloc.dart';
import '../../../bloc/signup/signup_event.dart';

class GenderPicker extends StatefulWidget {
  const GenderPicker({super.key});

  @override
  _GenderPickerState createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme
        .of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(
        color: Colors.black
    );

    return Theme(
      data: Theme.of(context).copyWith(hoverColor: AppColors.primaryColor),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return CustomPaint(
            painter: DashedBorderPainter(color: AppColors.borderColor),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              decoration: const InputDecoration(
                contentPadding: AppPadding.paddingHorizontal,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
              hint: Text("Gender", style: bodyMedium),
              dropdownColor: AppColors.white,
              onChanged: (value) => setState(() => _selectedGender = value),
              selectedItemBuilder: (context) =>
                  ["Male", "Female", "Other"]
                      .map((gender) => Text(gender, style: bodyMedium))
                      .toList(),
              items: ["Male", "Female", "Other"].map((gender) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: gender,
                  child: MouseRegion(
                    onEnter: (_) =>
                        context.read<SignupBloc>().add(OnHoverEvent(gender: gender)),
                    onExit: (_) =>
                        context.read<SignupBloc>().add(OnHoverEvent(gender: '')),
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      alignment: Alignment.center,
                      child: Text(
                        gender,
                        textAlign: TextAlign.center,
                        style: bodyMedium?.copyWith(
                          color: state.hoveredGender == gender
                              ? AppColors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
