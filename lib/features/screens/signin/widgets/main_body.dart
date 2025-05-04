import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micple_app/core/constant/App_icons.dart';
import 'package:micple_app/core/constant/app_colors.dart';
import 'package:micple_app/core/constant/app_padding.dart';
import 'package:micple_app/core/route_config/route_name.dart';
import 'package:micple_app/features/common/common_widgets.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
    required this.bodyMedium,
  });

  final TextStyle? bodyMedium;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.appLogo(onTap: (){
            Navigator.pushNamed(context, RouteNames.signinScreen);
          }),
          SizedBox(height: 10,),
          Container(
            width: 400,

            padding: AppPadding.paddingHorizontal,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(50)
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.imageSearch,fit: BoxFit.contain,width: 23,height: 23,),
                Expanded(
                  child:Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: AppColors.borderColor),
                          right: BorderSide(color: AppColors.borderColor),
                        )
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),

                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(AppIcons.voiceSearch,width: 23,height: 23,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
