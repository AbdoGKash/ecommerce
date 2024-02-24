import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

class CompleteCheckoutController extends GetxController {
  bool isActive = false;
  choosePaymentMethod(String val) {
    if (val == "cash") {
      isActive = true;
    } else if (val == "payment method") {
      isActive = true;
    }
  }

  goToCompleteCheckout() {
    Get.toNamed(AppRoute.completeCheckOut);
  }
}
