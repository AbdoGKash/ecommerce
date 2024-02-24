import 'package:ecommerce/applink.dart';
import 'package:ecommerce/core/class/crud.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addData(String usersId, String itemsId) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"usersid": usersId, "itemsid": itemsId});
    return response.fold((l) => l, (r) => r);
  }

  removeData(String usersId, String itemsId) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"usersid": usersId, "itemsid": itemsId});
    return response.fold((l) => l, (r) => r);
  }
}
