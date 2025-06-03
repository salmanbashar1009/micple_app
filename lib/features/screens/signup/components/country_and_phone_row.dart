// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../bloc/signup/text_form_bloc/text_form_bloc.dart';
import '../../../bloc/signup/text_form_bloc/text_form_event.dart';
import '../../../bloc/signup/text_form_bloc/text_form_state.dart';
import '../widgets/dash_border_painter.dart';
import '../widgets/dash_border_text_field.dart';

class CountryAndPhoneRow extends StatelessWidget {
  const CountryAndPhoneRow({
    super.key,
    required this.bodyMedium,
  });

  final TextStyle? bodyMedium;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormBloc,TextFormState>(
        builder: (context,state) {
          return Row(
            children: [
              Expanded(
                child: DashedBorderTextFormField(
                  hintText: 'Bangladesh',
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      color: AppColors.borderColor.withOpacity(0.1),
                      height: 50,
                      width: 100,
                      child: CustomPaint(
                        painter: DashedBorderPainter(
                          isDotted: true,
                          color: AppColors.borderColor,
                          widthDash: 5,
                        ),
                        child: Center(
                          child: Text(
                            "+880",
                            style: bodyMedium?.copyWith(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DashedBorderTextFormField(
                        hintText: '123 456 789',
                        fieldKey: "phone_number",
                        onChanged: (value) {
                          context.read<TextFormBloc>().add(
                            UpdateFieldEvent(
                              field: "phoneNumber",
                              value: value,
                            ),
                          );
                        },
                        enabled:
                        context.read<TextFormBloc>().canEditField(
                          'phoneNumber',
                          'password',
                        ) &&
                            state.fields['nationalId'] != null &&
                            state.fields['nationalId'].isNotEmpty,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}
