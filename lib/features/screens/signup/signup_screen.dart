import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/common/common_widgets.dart';
import 'package:micple_app/features/screens/signup/components/personal_info_input_section.dart';
import 'package:micple_app/features/screens/signup/components/residence_info_input_section.dart';
import 'package:micple_app/features/screens/signup/components/user_info_input_section.dart';

import '../../../core/constant/app_colors.dart';
import '../../bloc/signup/signup_bloc.dart';
import '../../bloc/signup/signup_state.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black
    );

    return Scaffold(
      appBar: AppBar(
        leading: CommonWidgets.backButton(context: context),
        title: CommonWidgets.appLogo(onTap: (){}),
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.paddingAll,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 980,
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    /// personal information input section
                    PersonalInfoInputSection(),

                    /// residence information input section
                    ResidenceInfoInputSection(),

                    /// user information input section
                    UserInfoInputSection(),

                    const SizedBox(height: 10),
                    BlocBuilder<SignupBloc,SignupState>(
                        builder: (context,state) {
                          return Align(
                            alignment: Alignment.center,
                            child: CommonWidgets.primaryButton(
                                onTap: () {

                                } ,
                                title: "Submit",
                                height: 35,
                                buttonColor: state.isTermsAccepted ? AppColors.primaryColor : AppColors.borderColor
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
