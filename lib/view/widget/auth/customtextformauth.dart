// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  String? Function(String?) validator;
  final String labelText;
  final String hintText;
  final Icon suffixIcon;
  final bool isNumber;
  late final bool? obscureText;
  void Function()? onTapIcon;
  TextEditingController? mycontroller = TextEditingController();
  CustomTextFormAuth(
      {super.key,
      this.onTapIcon,
      this.obscureText,
      required this.labelText,
      required this.hintText,
      required this.suffixIcon,
      required this.mycontroller,
      required this.validator,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
      obscureText: obscureText == null || obscureText == false ? false : true,
      controller: mycontroller,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(labelText)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          suffixIcon: InkWell(onTap: onTapIcon, child: suffixIcon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
