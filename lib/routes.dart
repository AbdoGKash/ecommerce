import 'package:ecommerce/controller/home/setting_controller.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resertpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/home/cart.dart';
import 'package:ecommerce/view/screen/home/checkout.dart';
import 'package:ecommerce/view/screen/home/favorite.dart';
import 'package:ecommerce/view/screen/home/items.dart';
import 'package:ecommerce/view/screen/home/productdatils.dart';
import 'package:ecommerce/view/screen/home/about.dart';
import 'package:ecommerce/view/screen/home/search.dart';
import 'package:ecommerce/view/screen/home/setting.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'view/screen/auth/forgetpassword/verifycode.dart';
import 'view/screen/home/completecheckout.dart';
import 'view/screen/home_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoute.verifyCodeSignUP, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  // home
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.setting, page: () => const Setting()),
  GetPage(name: AppRoute.favorite, page: () => const Favorite()),
  GetPage(name: AppRoute.about, page: () => const About()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productDatils, page: () => const ProductDatils()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),
  GetPage(
      name: AppRoute.completeCheckOut, page: () => const CompleteCheckout()),
  GetPage(name: AppRoute.search, page: () => const Search()),
  GetPage(name: AppRoute.changeLang, page: () => const ChangLanguage()),
];
