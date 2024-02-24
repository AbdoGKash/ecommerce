// ignore_for_file: must_be_immutable

import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitelauth.dart';
import '../../widget/auth/textsignuporlogin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignUPControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign up'.tr,
            style: const TextStyle(color: AppColor.gary),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<SignUPControllerImp>(
            builder: (controller) => HandlingDataRequest(
                stateRequest: controller.stateRequest,
                widget: PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    alertExitApp();
                  },
                  child: Form(
                    key: controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextTitelAuth(text: "Welcome Back".tr),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextBodyAuth(
                              text:
                                  "Sign up with your username \n email and password"
                                      .tr),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormAuth(
                            isNumber: false,
                            validator: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                            mycontroller: controller.username,
                            labelText: 'Username'.tr,
                            hintText: 'Enter your username'.tr,
                            suffixIcon: const Icon(Icons.person_2_outlined),
                          ),
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
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormAuth(
                            isNumber: true,
                            validator: (val) {
                              return validInput(val!, 5, 15, "phone");
                            },
                            mycontroller: controller.phone,
                            labelText: 'Phone'.tr,
                            hintText: 'Enter your phone'.tr,
                            suffixIcon:
                                const Icon(Icons.phone_android_outlined),
                          ),
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
                            suffixIcon: const Icon(Icons.lock_outline),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButtonAuth(
                            text: 'Sign up'.tr,
                            onPressed: () {
                              controller.signUp();
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextSignUpOrSignin(
                              text1: "have an account ? ".tr,
                              text2: "Sign in".tr,
                              onTap: () {
                                controller.goToSingIn();
                              }),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
