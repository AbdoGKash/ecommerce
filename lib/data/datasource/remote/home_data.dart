import 'package:ecommerce/core/class/crud.dart';

import '../../../applink.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  postData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
