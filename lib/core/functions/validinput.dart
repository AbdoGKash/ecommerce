import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "can't be empty".tr;
  }
  if (val.length < min) {
    return "${"can't be less than".tr}$min";
  }
  if (val.length > max) {
    return "${"can't be bigger than".tr}$max";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone".tr;
    }
  }
}
