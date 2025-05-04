import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoInputField extends StatelessWidget {
  const UserInfoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Personal Information",style: bodyMedium,),
        SizedBox(height: 10,),
        Text("Your username must be small letter and underscore_ then your favorite numbers.",style: bodyMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.w400),),
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(),
                  SizedBox(height: 10,),
                  TextFormField(),
                  SizedBox(height: 10,),
                  TextFormField(),

                ],
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                children: [
                  TextFormField(),
                  SizedBox(height: 10,),
                  TextFormField(),
                  SizedBox(height: 10,),
                  TextFormField(),

                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
