// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottomCart extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  CustomBottomCart({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: AppColor.primaryColor2,
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.white),
        ),
      ),
    );
  }
}
