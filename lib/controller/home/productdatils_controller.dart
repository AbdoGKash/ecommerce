import 'package:ecommerce/controller/home/cart_controller.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDatilsController extends GetxController {
  initialData();
  goToCart();
}

class ProductDatilsControllerImp extends ProductDatilsController {
  CartControllerImp cartController = Get.put(CartControllerImp());
  late ItemsModel itemsModel;

  List colorAndActive = [
    {"name": "Black", "id": "1", "active": "0"},
    {"name": "White", "id": "1", "active": "0"},
    {"name": "Purple", "id": "1", "active": "1"}
  ];

  @override
  initialData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart, arguments: {"itemsModel": itemsModel});
  }
}
//       Get.toNamed(AppRoute.cart, arguments: {
//       "imageproduct": itemsModel.itemsImage,
//       "nameproduct": itemsModel.itemsName,
//       "priceproduct": itemsModel.itemsPrice.toString()
//     });
// }
