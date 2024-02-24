import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/color.dart';

class Contact extends StatelessWidget {
  final String name;
  final String url;
  final IconData icon;
  const Contact(
      {super.key, required this.url, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      title: Text(name),
      trailing: Icon(
        icon,
        color: AppColor.primaryColor2,
      ),
    );
  }
}
