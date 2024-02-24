import 'package:ecommerce/core/class/crud.dart';

import '../../../applink.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  postData(String categories, String usersid) async {
    var response = await crud.postData(AppLink.items, {
      "categoriesid": categories.toString(),
      "usersid": usersid
    }); // categoriesid = categoriesid in the php (same name)
    return response.fold((l) => l, (r) => r);
  }
}
