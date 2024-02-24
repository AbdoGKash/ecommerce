import 'package:ecommerce/controller/forgetpassword/successresetpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitelauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomTextTitelAuth(text: "Success".tr),
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              color: AppColor.primaryColor,
              size: 200,
            ),
          ),
          CustomTextBodyAuth(
              text: "The password has been reset successfully".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
              text: 'Go To Login'.tr,
              onPressed: () {
                controller.goToLogin();
              },
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    ));
  }
}
