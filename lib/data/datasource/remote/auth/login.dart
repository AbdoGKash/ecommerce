import 'package:ecommerce/applink.dart';
import 'package:ecommerce/core/class/crud.dart';

class LoginData {
  Crud curd;
  LoginData(this.curd);

  postData(String email, String password) async {
    var response = await curd
        .postData(AppLink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
