import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/functions/handlingdata.dart';

abstract class ItemsController extends GetxController {
  initialData();
  chageSelectedCategories(
      int selected,
      String
          categoriesOnpressed); // categoriesOnpressed لما بضغط علي القسم اللي ف صفحه الايتم يجيب الداتا اللي فيه
  getData(String categoriesId);
  goToProductDatils(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  StateRequest? stateRequest;
  List data = [];
  String? categoriesId;
  List categories = [];
  int? selectedCategories;

  @override
  initialData() {
    categories = Get.arguments['categories']; // this is from home controller
    selectedCategories =
        Get.arguments['selectCategories']; // this is from home controller
    categoriesId = Get.arguments['categoriesid'];
    getData(categoriesId!); // To get the data when I open the page
  }

  @override
  void onInit() {
    initialData(); // To get the data when I open the page
    super.onInit();
  }

  @override
  chageSelectedCategories(selected, categoriesOnpressed) {
    selectedCategories = selected;
    categoriesId =
        categoriesOnpressed; // فيديو 73  categoriesOnpressed لما بضغط علي القسم اللي ف صفحه الايتم يجيب الداتا اللي فيه
    getData(
        categoriesId!); // بستدعي البيانات مره اخري ولكن بناء علي الكتيجوري اي دي غير اللي تحت اللي هنا بتاع الضغط علي القسم ف صفحه الايتم

    update();
  }

  @override
  getData(categoriesId) async {
    data.clear(); // بفضي الداتا قبل اي حاجه عشان انا بستعمل الجيت داتا فوق وجايز يكون فيها داتا
    stateRequest = StateRequest.loading;
    update();
    var response = await itemsData.postData(
        categoriesId, myServices.sharedPreferences.getString("id")!);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDatils(itemsModel) {
    Get.toNamed(AppRoute.productDatils, arguments: {"itemsModel": itemsModel});
  }
}
