import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextProduct extends StatelessWidget {
  final String text;
  const CustomTextProduct({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColor.homeColor,
          fontFamily: "snsn"),
    );
  }
}
