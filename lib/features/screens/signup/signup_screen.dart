import 'package:flutter/material.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/features/common/common_widgets.dart';
import 'package:micple_app/features/screens/signup/widgets/personal_info_input_field.dart';
import 'package:micple_app/features/screens/signup/widgets/residence_info_input_field.dart';
import 'package:micple_app/features/screens/signup/widgets/user_info_input_field.dart';

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
              child: SizedBox(
                width: 980,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    /// personal information input fields
                    PersonalInfoInputField(),
                    SizedBox(height: 10,),
                    ResidenceInfoInputField(),
                    SizedBox(height: 10,),
                    UserInfoInputField()
          
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
