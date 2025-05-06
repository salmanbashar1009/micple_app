import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';

import '../../../bloc/signup/signup_event.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Row(
      children: [
        BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<SignupBloc>().add(TermsAcceptedEvent());
              },
              child: Icon(
                state.isTermsAccepted
                    ? Icons.check_box : Icons.check_box_outline_blank,
                color:
                    state.isTermsAccepted
                        ? AppColors.primaryColor
                        : Colors.black54,
              ),
            );
          },
        ),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: bodyMedium?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text:
                    "By checking this box, I confirm that I have read, understand and agree to the ",
              ),
              TextSpan(
                text: "Terms and Conditions",
                style: bodyMedium?.copyWith(color: AppColors.primaryColor),
              ),
              TextSpan(text: " and Privacy Policy"),
            ],
          ),
        ),
      ],
    );
  }
}
