import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_padding.dart';
import '../../../bloc/signup/signup_bloc.dart';
import '../../../bloc/signup/signup_event.dart';
import '../../../bloc/signup/signup_state.dart';


class DropdownWidget extends StatelessWidget {
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final String fieldKey;
  final Function(String?)? onChanged;
  final bool? enabled;

  const DropdownWidget({
    Key? key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.fieldKey,
    this.onChanged,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      padding: EdgeInsets.zero,
      elevation: 2,
      alignment: Alignment.centerLeft,
      menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
      itemHeight: null,
      value: selectedValue,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(
        enabled: enabled ?? false,
        contentPadding: AppPadding.paddingHorizontal,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
      enableFeedback: enabled,
      hint: Text(
        hint,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
      ),
      dropdownColor: AppColors.white,
      onChanged: onChanged,
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
          alignment: Alignment.center,
          value: item,
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return MouseRegion(
                onEnter: (_) => context.read<SignupBloc>().add(OnHoverEvent(value: item)),
                onExit: (_) => context.read<SignupBloc>().add(OnHoverEvent(value: " ")),
                child: Container(
                  width: double.infinity,
                  height: 35,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: state.hoveredValue == item ? AppColors.white : Colors.black87,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}