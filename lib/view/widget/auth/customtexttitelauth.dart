import 'package:flutter/material.dart';

class CustomTextTitelAuth extends StatelessWidget {
  final String text;
  const CustomTextTitelAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }
}
