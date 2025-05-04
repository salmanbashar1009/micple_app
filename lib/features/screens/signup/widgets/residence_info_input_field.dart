import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidenceInfoInputField extends StatelessWidget {
  const ResidenceInfoInputField({super.key});

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
        Text("Residence Information",style: bodyMedium,),
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
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
