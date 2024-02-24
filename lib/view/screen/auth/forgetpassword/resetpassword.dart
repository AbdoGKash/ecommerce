// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/controller/forgetpassword/resetpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitelauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reset Password'.tr,
            style: TextStyle(color: AppColor.gary),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
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
                        CustomTextTitelAuth(text: "Reset Password".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextBodyAuth(
                            text: "Please Enter new Password".tr),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          validator: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          labelText: 'Password'.tr,
                          hintText: 'Enter your password'.tr,
                          suffixIcon: Icon(Icons.lock_outline),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          validator: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.rePassword,
                          labelText: 'Re Password'.tr,
                          hintText: 'Re Enter your password'.tr,
                          suffixIcon: Icon(Icons.lock_outline),
                        ),
                        CustomButtonAuth(
                          text: 'Save'.tr,
                          onPressed: () {
                            controller.resetPassword();
                          },
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
