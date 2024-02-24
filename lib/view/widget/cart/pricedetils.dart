// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Price extends StatelessWidget {
  final String price;
  final String label;
  Color? color;
  Price({super.key, required this.price, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          "$price \$",
          style: const TextStyle(
              color: AppColor.primaryColor2,
              fontFamily: "",
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
