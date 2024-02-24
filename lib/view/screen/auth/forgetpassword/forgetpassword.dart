import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitelauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Forget Password'.tr,
            style: const TextStyle(color: AppColor.gary),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                stateRequest: controller.stateRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextTitelAuth(text: "Check Email".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextBodyAuth(text: "Check with your email".tr),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          validator: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          labelText: 'Email'.tr,
                          hintText: 'Enter your email'.tr,
                          suffixIcon: const Icon(Icons.email_outlined),
                        ),
                        CustomButtonAuth(
                          text: 'Check'.tr,
                          onPressed: () {
                            controller.checkemail();
                          },
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
