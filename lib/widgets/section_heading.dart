import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
class SectionHeading extends StatelessWidget {
  final String heading;
  final String buttonText;
  const SectionHeading({super.key, required this.heading, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading, style: Styles.headLineStyle2,),
        InkWell(
            onTap: (){
              print("You are tapped");
            },
            child: Text(buttonText, style: Styles.textStyle.copyWith(color: Styles.primaryColor),)
        ),
      ],
    );
  }
}
