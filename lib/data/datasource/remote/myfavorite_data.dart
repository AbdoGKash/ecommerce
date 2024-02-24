import 'package:ecommerce/core/class/crud.dart';

import '../../../applink.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  postData(String usersId) async {
    var response =
        await crud.postData(AppLink.myFavorite, {"usersid": usersId});
    return response.fold((l) => l, (r) => r);
  }

  remove(String favoriteId) async {
    var response = await crud
        .postData(AppLink.removeMyFavorite, {"favoriteid": favoriteId});
    return response.fold((l) => l, (r) => r);
  }
}
