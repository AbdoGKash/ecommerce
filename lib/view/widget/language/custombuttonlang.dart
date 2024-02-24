// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textButton;
  void Function()? onPressed;
  CustomButtonLanguage(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        child: Text(
          textButton,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
