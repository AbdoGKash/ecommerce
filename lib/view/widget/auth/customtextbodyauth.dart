import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: AppColor.gary),
      textAlign: TextAlign.center,
    );
  }
}
