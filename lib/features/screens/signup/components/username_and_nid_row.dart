import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/signup/text_form_bloc/text_form_bloc.dart';
import '../../../bloc/signup/text_form_bloc/text_form_event.dart';
import '../../../bloc/signup/text_form_bloc/text_form_state.dart';
import '../widgets/custom_tooltip.dart';
import '../widgets/dash_border_text_field.dart';
import '../widgets/user_name_container.dart';

class UsernameAndNidRow extends StatelessWidget {
  const UsernameAndNidRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormBloc,TextFormState>(
        builder: (context,state) {
          return Row(
            children: [
              Expanded(child: UsernameContainer()),
              const SizedBox(width: 20),
              Expanded(
                child: DashedBorderTextFormField(
                  hintText: 'Enter your national ID/SSN Number',
                  fieldKey: 'nid',
                  onChanged: (value) {
                    context.read<TextFormBloc>().add(
                      UpdateFieldEvent(field: "nationalId", value: value),
                    );
                  },
                  enabled:
                  context.read<TextFormBloc>().canEditField(
                    'nationalId',
                    'phoneNumber',
                  ) &&
                      state.fields['zipCode'] != null &&
                      state.fields['zipCode'].isNotEmpty,
                  suffixIcon: CustomToolTip(
                    message:
                    "NID number used in your government-issued ID, written in English characters and digits",
                    fieldKey: "nid",
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}
