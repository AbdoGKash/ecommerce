// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  final String text1;
  final String text2;
  void Function() onTap;
  CustomTextSignUpOrSignin(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
