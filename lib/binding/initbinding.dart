import 'package:get/get.dart';
import '../core/class/crud.dart';

class InitinalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()); // هو هيستدعيها لما يحتاجها
  }
}
