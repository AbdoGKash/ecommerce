import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class StyelPae extends StatelessWidget {
  const StyelPae({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // مهم
      clipBehavior: Clip
          .none, // لمنه اختفاء الاشياء الاخري اللي ف الاستاك لو خدت حجم اكبر
      children: [
        Container(
          height: 150,
          width: Get.width,
          decoration: const BoxDecoration(
              color: AppColor.primaryColor2,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        Positioned(
            top: 100,
            child: Container(
                // alignment: Alignment.center,
                height: 100,
                width: 100,
                // padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(AppImageAsset.cash))),
      ],
    );
  }
}
