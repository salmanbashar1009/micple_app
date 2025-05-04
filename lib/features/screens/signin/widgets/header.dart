import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/route_config/route_name.dart';
import 'package:micple_app/features/bloc/signin/sign_event.dart';
import 'package:micple_app/features/bloc/signin/signin_bloc.dart';
import 'package:micple_app/features/bloc/signin/signin_state.dart';
import 'package:micple_app/features/common/common_widgets.dart';
import 'package:micple_app/features/screens/signup/signup_screen.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child:
                  state.isSigninButtonVisible
                      ? CommonWidgets.primaryButton(onTap: () {
                    debugPrint('Button tapped');
                        context.read<SigninBloc>().add(ToggleSigninButton());
                  })
                      : Column(
                        children: [
                          SizedBox(
                            width: 160,
                            height: 30,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "User ID"),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteNames.signupScreen);
                            },
                            child: Text(
                              "Create an account",
                              style: bodyLarge?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
            ),
          ],
        );
      },
    );
  }
}
