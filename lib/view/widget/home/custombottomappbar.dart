// ignore_for_file: must_be_immutable

import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;
  bool active = false;
  CustomBottomAppBar(
      {super.key,
      this.onPressed,
      required this.active,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 1,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color:
                  active == true ? AppColor.primaryColor2 : AppColor.darkgray),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: active == true
                    ? AppColor.primaryColor2
                    : AppColor.darkgray),
          )
        ],
      ),
    );
  }
}
