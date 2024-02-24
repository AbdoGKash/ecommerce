import 'package:ecommerce/applink.dart';
import 'package:ecommerce/core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addData(String usersId, String itemsId) async {
    var response = await crud
        .postData(AppLink.cartAdd, {"usersid": usersId, "itemsid": itemsId});
    return response.fold((l) => l, (r) => r);
  }

  removeData(String usersId, String itemsId) async {
    var response = await crud
        .postData(AppLink.cartRemove, {"usersid": usersId, "itemsid": itemsId});
    return response.fold((l) => l, (r) => r);
  }

  viewData(String usersId) async {
    var response = await crud.postData(AppLink.cartView, {"usersid": usersId});
    return response.fold((l) => l, (r) => r);
  }
}
