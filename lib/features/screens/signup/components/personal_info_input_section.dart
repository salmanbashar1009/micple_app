import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_bloc.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_event.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_state.dart';
import 'package:micple_app/features/screens/signup/widgets/custom_date_picker.dart';
import 'package:micple_app/features/screens/signup/widgets/dash_border_text_field.dart';
import 'package:micple_app/features/screens/signup/widgets/gender_picker.dart';
import '../widgets/custom_tooltip.dart';

class PersonalInfoInputSection extends StatelessWidget {
   PersonalInfoInputSection({super.key});

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    return BlocBuilder<TextFormBloc, TextFormState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Personal Information", style: bodyMedium),
              /// first and last name input field
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: DashedBorderTextFormField(
                      fieldKey: "first_name",
                      hintText: "First Name",
                      onChanged: (value) {
                        context.read<TextFormBloc>().add(
                          UpdateFieldEvent(field: "firstName", value: value),
                        );
                      },
                      enabled: context.read<TextFormBloc>().canEditField(
                        'firstName',
                        'lastName',
                      ),
                      suffixIcon: CustomToolTip(
                        message:
                            "First name used in your government-issued ID, written in English characters.\nIn case your name do contain digits, type digits in words",
                        fieldKey: "first_name",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DashedBorderTextFormField(
                      fieldKey: "last_name",
                      hintText: "Last Name",
                      onChanged: (value) {
                        context.read<TextFormBloc>().add(
                          UpdateFieldEvent(field: "lastName", value: value),
                        );
                      },
                      enabled:
                          context.read<TextFormBloc>().canEditField(
                            'lastName',
                            'fatherName',
                          ) &&
                          state.fields['firstName'] != null &&
                          state.fields['firstName'].isNotEmpty,
                      suffixIcon: CustomToolTip(
                        message:
                            "Last name used in your government-issued ID, written in English characters.\nIn case your name do contain digits, type digits in words",
                        fieldKey: "last_name",
                      ),
                    ),
                  ),
                ],
              ),
              /// father's and mother's name input field
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: DashedBorderTextFormField(
                      fieldKey: "father_name",
                      hintText: "Father Name",
                      onChanged: (value) {
                        context.read<TextFormBloc>().add(UpdateFieldEvent(field: "fatherName", value: value));
                      },
                      enabled: context.read<TextFormBloc>().canEditField('fatherName', 'motherName') && state.fields['lastName'] != null && state.fields['lastName'].isNotEmpty,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DashedBorderTextFormField(
                      fieldKey: "mother_name",
                      hintText: "Mother Name",
                      onChanged: (value) {
                        context.read<TextFormBloc>().add(UpdateFieldEvent(field: "motherName", value: value));
                      },
                      enabled: context.read<TextFormBloc>().canEditField('motherName', 'year') && state.fields['fatherName'] != null && state.fields['fatherName'].isNotEmpty,
                    ),
                  ),
                ],
              ),
              /// Date and gender picker row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CustomDatePicker(
                    onChangeYear:context.read<TextFormBloc>().canEditField('year', 'month') && state.fields['motherName'] != null && state.fields['motherName'].isNotEmpty ? (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "year", value: value));
                    } : null,
                    onChangeMonth:context.read<TextFormBloc>().canEditField('month', 'day') && state.fields['year'] != null && state.fields['year'].isNotEmpty ? (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "month", value: value));
                    }: null,
                    onChangeDay: context.read<TextFormBloc>().canEditField('day', 'gender') && state.fields['month'] != null && state.fields['month'].isNotEmpty ? (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "day", value: value));
                    } : null,
                  )),
                  SizedBox(width: 20),
                  Expanded(child: GenderPicker(
                    onChanged:context.read<TextFormBloc>().canEditField('gender', 'address') && state.fields['day'] != null && state.fields['day'].isNotEmpty ? (value) {
                      context.read<TextFormBloc>().add(UpdateFieldEvent(field: "gender", value: value));
                    } : null,
                  )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
