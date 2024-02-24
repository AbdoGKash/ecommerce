import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/about/contact.dart';
import '../../widget/about/styelpage.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const StyelPae(),
        const SizedBox(
          height: 80,
        ),
        Contact(
          url: 'tel:01025598871',
          icon: Icons.call_outlined,
          name: 'Contact us'.tr,
        ),
        Contact(
          url: 'sms:01025598871',
          icon: Icons.sms_outlined,
          name: 'Send SMS'.tr,
        ),
        Contact(
          url: 'url:https://www.facebook.com/',
          icon: Icons.facebook_outlined,
          name: 'Facebook'.tr,
        ),
        Contact(
          url: 'sms:01025598871',
          icon: Icons.wechat_sharp,
          name: 'whatsapp'.tr,
        ),
      ],
    );
  }
}
