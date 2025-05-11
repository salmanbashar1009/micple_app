import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class HomeBodyContent extends StatelessWidget {
  const HomeBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(100, (index){
            return Container(
              constraints: BoxConstraints(
                maxWidth: deviceWidth < 980 ? 300 : (deviceWidth < 1280 ? 400 : (deviceWidth < 1440 ? 450 : (deviceWidth < 1650 ? 500 : 600)))
              ),
              padding: EdgeInsets.all(3),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor)
              ),
              child: Row(
                spacing: 10,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/images/person.png"),
                        onError: (_,__)=> Image.asset("assets/images/person.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("https://micple.com ",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor
                    ),),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
