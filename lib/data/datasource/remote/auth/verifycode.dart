import 'package:ecommerce/applink.dart';
import 'package:ecommerce/core/class/crud.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifyCode, {"email": email, "verifycode": verifycode});

    return response.fold((l) => l, (r) => r);
  }
}
