import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/signup/text_form_bloc/text_form_bloc.dart';
import '../../../bloc/signup/text_form_bloc/text_form_event.dart';
import '../../../bloc/signup/text_form_bloc/text_form_state.dart';
import '../widgets/dash_border_text_field.dart';

class PasswordRow extends StatelessWidget {
  const PasswordRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormBloc,TextFormState>(
        builder: (context,state) {
          return Row(
            children: [
              Expanded(
                child: DashedBorderTextFormField(
                  fieldKey: "new_password",
                  hintText: "New Password",
                  onChanged: (value) {
                    context.read<TextFormBloc>().add(
                      UpdateFieldEvent(field: "password", value: value),
                    );
                  },
                  enabled:
                  context.read<TextFormBloc>().canEditField(
                    'password',
                    'confirmPassword',
                  ) &&
                      state.fields['phoneNumber'] != null &&
                      state.fields['phoneNumber'].isNotEmpty,
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: DashedBorderTextFormField(
                  fieldKey: "confirm_password",
                  hintText: "Confirm Password",
                  onChanged: (value) {
                    context.read<TextFormBloc>().add(
                      UpdateFieldEvent(
                        field: "confirmPassword",
                        value: value,
                      ),
                    );
                  },
                  enabled:
                  context.read<TextFormBloc>().canEditField(
                    'confirmPassword',
                    'termsAccepted',
                  ) &&
                      state.fields['password'] != null &&
                      state.fields['password'].isNotEmpty,
                ),
              ),
            ],
          );
        }
    );
  }
}