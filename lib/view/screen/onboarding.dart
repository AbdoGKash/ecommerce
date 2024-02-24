import 'package:ecommerce/controller/onborading_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/onborading/dotcontroller.dart';
import 'package:ecommerce/view/widget/onborading/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/onborading/custombutton.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    //getx dependency injection
    Get.put(OnBoradingControllerImp());
    return const SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.backGroundColor,
          body: Column(
            children: [
              Expanded(flex: 3, child: CustomSliderOnBorading()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotControllerOnBorading(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButtonOnBording()
                    ],
                  ))
            ],
          )),
    );
  }
}
