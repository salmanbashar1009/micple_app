import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micple_app/core/constant/app_padding.dart';

import '../../../../core/constant/App_icons.dart';
import '../../../../core/constant/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),

                  ),
                ),
              ),
            ),
          ),
          SvgPicture.asset(AppIcons.voiceSearch,width: 23,height: 23,)
        ],
      ),
    );
  }
}
