import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      color: Color(0xFFe4e4e4),
      child: Row(
        children: [
          Text("Dhaka,Bangladesh",style: bodyMedium,),
          Spacer(),
          Text("©Micple™",style: bodyMedium,),
          Spacer(),
          GestureDetector(
              onTap: (){},
              child: Text("About us >",style: bodyMedium,))
        ],
      ),
    );
  }
}
