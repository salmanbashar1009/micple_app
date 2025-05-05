import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_event.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';

import 'dash_border_painter.dart';

class DashedBorderTextFormField extends StatefulWidget {
  final bool isDotted;
  final Widget? suffixIcon;
  final String hintText;
  final String? fieldKey;
  final bool? readOnly;
  final TextEditingController? controller;
  final  Function(String)? onChanged;
  final bool? enabled;

  const DashedBorderTextFormField({
    super.key,
    this.isDotted = false,
    required this.hintText,
    this.suffixIcon,
    this.fieldKey,
    this.readOnly,
    this.controller,
    this.onChanged, this.enabled
  });

  @override
  State<DashedBorderTextFormField> createState() =>
      _DashedBorderTextFormFieldState();
}

class _DashedBorderTextFormFieldState extends State<DashedBorderTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      final bloc = context.read<SignupBloc>();
      bloc.add(
        TextFieldFocusedEvent(
          fieldKey: widget.fieldKey ?? ' ',
          isFocused: _focusNode.hasFocus,
        ),
      );
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final isFocused = state.focusMap[widget.fieldKey] ?? false;

        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
          child: CustomPaint(
            painter: DashedBorderPainter(
              isDotted: widget.isDotted,
              color: isFocused ? Colors.green : AppColors.borderColor,
            ),
            child: TextFormField(
              controller: widget.controller,
              focusNode: _focusNode,
              readOnly: widget.readOnly ?? false,
              onChanged: widget.onChanged,
              enabled: widget.enabled,
              decoration: InputDecoration(
                filled: isFocused ? false : true,
                fillColor: AppColors.borderColor.withOpacity(0.1),
                hoverColor: Colors.transparent,
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.all(12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none, // Remove default border
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                suffixIcon: widget.suffixIcon,
              ),
            ),
          ),
        );
      },
    );
  }
}
