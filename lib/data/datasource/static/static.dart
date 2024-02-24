import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:get/get.dart';
import '../../model/onboradingmodel.dart';

List<OnBoradingModel> onBoradingList = [
  OnBoradingModel(
      titel: "Choose Product".tr,
      image: AppImageAsset.onBoradingImageOne,
      body:
          "We Have a Meny Product \n Choose Your Product From Our \n E-commerce App"
              .tr),
  OnBoradingModel(
      titel: "Easy and Safe Payment".tr,
      image: AppImageAsset.onBoradingImageTwo,
      body:
          "Easy Checkout and Safe Payment\n method. Trusted by our Coustomers \n from all over the world"
              .tr),
  OnBoradingModel(
      titel: "Track Your Order".tr,
      image: AppImageAsset.onBoradingImageThree,
      body:
          "Reliable And Fast Delivery. We\n Deliver your product the fastest \n way possible"
              .tr),
];
