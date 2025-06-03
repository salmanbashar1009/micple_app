import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/data/date_data.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_bloc.dart';
import 'package:micple_app/features/screens/signup/widgets/custom_tooltip.dart';
import 'package:micple_app/features/screens/signup/widgets/dropdown_widget.dart';
import 'dash_border_painter.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    this.onChangeYear,
    this.enabledYear,
    this.onChangeMonth,
    this.enabledMonth,
    this.onChangeDay,
    this.enabledDay,
  });

  final Function(String?)? onChangeYear;
  final bool? enabledYear;
  final Function(String?)? onChangeMonth;
  final bool? enabledMonth;
  final Function(String?)? onChangeDay;
  final bool? enabledDay;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(hoverColor: AppColors.primaryColor),
      child: SizedBox(
        height: 40,
          child: CustomPaint(
          painter: DashedBorderPainter(
            isDotted: true,
            color: AppColors.borderColor,
            widthDash: 5.0,
          ),
          child: Padding(
            padding: AppPadding.paddingHorizontal,
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                final formState = context.watch<TextFormBloc>().state;

                /// drop down menu to pick the date.
                return Row(
                  children: [
                    Expanded(
                      child: DropdownWidget(
                        hint: 'Year',
                        items: DateData.years,
                        selectedValue: formState.fields['year'],
                        fieldKey: "year",
                        onChanged: onChangeYear,
                        enabled: enabledYear,
                      ),
                    ),
                    Expanded(
                      child: DropdownWidget(
                        hint: 'Month',
                        items: DateData.monthNames,
                        selectedValue: formState.fields['month'],
                        fieldKey: "month",
                        onChanged: onChangeMonth,
                        enabled: enabledMonth,
                      ),
                    ),
                    Expanded(
                      child: DropdownWidget(
                        hint: 'Day',
                        items: DateData.days,
                        selectedValue: formState.fields['day'],
                        fieldKey: "day",
                        onChanged: onChangeDay,
                        enabled: enabledDay,
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomToolTip(
                      message:
                          "Date of birth as listed on your government-issued ID.\nYou must be over 18 years old to apply",
                      fieldKey: "date_picker",
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
