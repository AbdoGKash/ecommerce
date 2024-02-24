// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: AppColor.primaryColor2,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }
}
