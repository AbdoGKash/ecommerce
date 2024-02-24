import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/textsignuporlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitelauth.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign in'.tr,
            style: const TextStyle(color: AppColor.gary),
          ),
          centerTitle: true,
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              alertExitApp();
            },
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      stateRequest: controller.stateRequest,
                      widget: Form(
                        key: controller.formstate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextTitelAuth(text: "Welcome Back".tr),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextBodyAuth(
                                  text: "Sign in with your email and password"
                                      .tr),
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
                                  suffixIcon: const Icon(Icons.email_outlined)),
                              const SizedBox(
                                height: 30,
                              ),
                              // // to refresh ui
                              GetBuilder<LoginControllerImp>(
                                  builder: (controller) => CustomTextFormAuth(
                                        obscureText: controller.isShowPassword,
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                        isNumber: false,
                                        validator: (val) {
                                          return validInput(
                                              val!, 5, 30, "password");
                                        },
                                        mycontroller: controller.password,
                                        labelText: 'Password'.tr,
                                        hintText: 'Enter your password'.tr,
                                        suffixIcon:
                                            const Icon(Icons.lock_outline),
                                      )),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "Forget Password".tr,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      color: AppColor.primaryColor),
                                ),
                              ),
                              CustomButtonAuth(
                                text: 'Sign in'.tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextSignUpOrSignin(
                                  text1: "Don't have an account ? ".tr,
                                  text2: "Sign Up".tr,
                                  onTap: () {
                                    controller.goToSingUp();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
