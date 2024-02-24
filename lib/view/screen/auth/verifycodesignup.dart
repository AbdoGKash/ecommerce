import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verifycodesignup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitelauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Verification Code'.tr,
            style: const TextStyle(color: AppColor.gary),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<VerfiyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                stateRequest: controller.stateRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextTitelAuth(text: "Check Code".tr),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBodyAuth(
                          text:
                              "${"Please Enter Digit Code Sent To".tr}${controller.email}"),
                      const SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        fieldWidth: 40,
                        borderRadius: BorderRadius.circular(25),
                        numberOfFields: 5,
                        borderColor: AppColor.primaryColor,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                        },
                      ),
                    ],
                  ),
                ))));
  }
}
