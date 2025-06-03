import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_bloc.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_event.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_state.dart';

import 'dash_border_text_field.dart';

class ResidenceInfoInputField extends StatelessWidget {
  const ResidenceInfoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    return BlocBuilder<TextFormBloc, TextFormState>(
      builder: (context,state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Residence Information", style: bodyMedium),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DashedBorderTextFormField(
                    fieldKey: "address",
                    hintText: "Address",
                    onChanged: (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "address", value: value));
                    },
                    enabled: context.read<TextFormBloc>().canEditField('address', 'city') && state.fields['gender'] != null && state.fields['gender'].isNotEmpty,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DashedBorderTextFormField(
                    fieldKey: "city",
                    hintText: "City",
                    onChanged: (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "city", value: value));
                    },
                    enabled: context.read<TextFormBloc>().canEditField('city', 'state') && state.fields['address'] != null && state.fields['address'].isNotEmpty,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DashedBorderTextFormField(
                    fieldKey: "state",
                    hintText: "State",
                    onChanged: (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "state", value: value));
                    },
                    enabled: context.read<TextFormBloc>().canEditField('state', 'zipCode') && state.fields['city'] != null && state.fields['city'].isNotEmpty,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DashedBorderTextFormField(
                    fieldKey: "zip",
                    hintText: "Zip/Postal Code",
                    onChanged: (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "zipCode", value: value));
                    },
                    enabled: context.read<TextFormBloc>().canEditField('zipCode', 'nationalID') && state.fields['state'] != null && state.fields['state'].isNotEmpty,
                  ),
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}
