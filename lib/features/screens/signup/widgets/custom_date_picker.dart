import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/core/utils/data_data.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_event.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';
import 'package:micple_app/features/screens/signup/widgets/custom_tooltip.dart';

import 'dash_border_painter.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: CustomPaint(
        painter: DashedBorderPainter(
            isDotted: true, color: AppColors.borderColor, widthDash: 5.0),
        child: Padding(
          padding: AppPadding.paddingHorizontal,
          child: BlocBuilder<SignupBloc,SignupState>(
            builder: (context,state) {
              return Row(
                children: [
                  Expanded(child: _buildDropdown(
                      context: context, hint: 'Year', items: DateData.years, selectedValue:state.dropdownValues['year'], fieldKey: "year" )),
                  Expanded(child: _buildDropdown(
                      context: context, hint: 'Month', items: DateData.monthNames,selectedValue: state.dropdownValues['month'], fieldKey: "month")),
                  Expanded(child: _buildDropdown(
                      context: context, hint: 'Day', items: DateData.days,selectedValue: state.dropdownValues['day'],fieldKey: "day")),

                  CustomToolTip(
                      message: "Date of birth as listed on your government-issued ID. You must be over 18 years old to apply",
                      fieldKey: "date_picker"),
                ],
              );
            }
          ),
        ),
      ),
    );
  }


  /// drop down menu to pick the date.
  Widget _buildDropdown({
    required BuildContext context,
    required String hint,
    required List<String> items,
    required String? selectedValue,
    required String fieldKey
  }) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration:  InputDecoration(
        contentPadding: AppPadding.paddingHorizontal,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
      hint: Text(
        hint,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
      ),
      dropdownColor: AppColors.white,
      onChanged: (value){
        context.read<SignupBloc>().add(
            DropdownValueChangedEvent(fieldKey: fieldKey, selectedValue: value!)
        );
      },
      selectedItemBuilder: (context) {
        return items.map((item) {
          return Text(
            item,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
          );
        }).toList();
      },
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color:  Colors.black87,
            ),
          ),
        );
      }).toList(),
    );
  }



}
