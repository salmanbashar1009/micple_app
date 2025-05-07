import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class HomeBodyContent extends StatelessWidget {
  const HomeBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.width;
    return Expanded(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(20, (index){
          return Container(
            constraints: BoxConstraints(
              maxHeight: 35,
              minHeight: 30,
              maxWidth:deviceHeight > 1440 ? 600 : 450 ,
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
                      onError: (_,_)=> Image.asset("assets/images/person.png"),
                    ),
                  ),
                ),
                Text("https://micple.com",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor
                ),)
              ],
            ),
          );
        }),
      ),
    );
  }
}
