import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/core/utils/date_data.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_event.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_bloc.dart';
import 'package:micple_app/features/screens/signup/widgets/custom_tooltip.dart';
import 'dash_border_painter.dart';
class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key, this.onChangeYear, this.enabledYear, this.onChangeMonth, this.enabledMonth, this.onChangeDay, this.enabledDay, });
  final Function(String?)? onChangeYear;
  final  bool? enabledYear;
  final Function(String?)? onChangeMonth;
  final  bool? enabledMonth;
  final Function(String?)? onChangeDay;
  final  bool? enabledDay;


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(hoverColor: AppColors.primaryColor),
      child: Container(
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

                final formState = context.watch<TextFormBloc>().state;

                return Row(
                  children: [
                    Expanded(child: _buildDropdown(
                        context: context, hint: 'Year', items: DateData.years, selectedValue:formState.fields['year'], fieldKey: "year",onChanged: onChangeYear,enabled: enabledYear, value: state.dropdownValues['year'])),
                    Expanded(child: _buildDropdown(
                        context: context, hint: 'Month', items: DateData.monthNames,selectedValue: formState.fields['month'], fieldKey: "month",onChanged: onChangeMonth,enabled: enabledMonth)),
                    Expanded(child: _buildDropdown(
                        context: context, hint: 'Day', items: DateData.days,selectedValue: formState.fields['day'],fieldKey: "day",onChanged: onChangeDay,enabled: enabledDay)),
                    SizedBox(width: 10,),
                    CustomToolTip(
                        message: "Date of birth as listed on your government-issued ID.\nYou must be over 18 years old to apply",
                        fieldKey: "date_picker"),
                  ],
                );
              }
            ),
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
    required String fieldKey,
    Function(String?)? onChanged,
    bool? enabled,
    String? value
  }) {
    return DropdownButtonFormField<String>(
      padding: EdgeInsets.zero,
      elevation: 2,
      alignment: Alignment.centerLeft,
      menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
      itemHeight: null,
      value: value,
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
      onChanged: onChanged,
      enableFeedback: enabled,
      selectedItemBuilder: (context) {
        return items.map((item) {
          return Text(
            item, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:  Colors.black),
          );
        }).toList();
      },
      items: items.map((item) {
        return DropdownMenuItem<String>(
          alignment: Alignment.center,
          value: item,
          child: BlocBuilder<SignupBloc,SignupState>(
            builder: (context,state) {
              return MouseRegion(
                onEnter: (_)=>context.read<SignupBloc>().add(OnHoverEvent(value: item)),
                onExit: (_)=>context.read<SignupBloc>().add(OnHoverEvent(value: " ")),
                child: Container(
                  width: double.infinity,
                  height: 35,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:  state.hoveredValue == item ? AppColors.white : Colors.black87,
                    ),
                  ),
                ),
              );
            }
          ),
        );
      }).toList(),
    );
  }
}
