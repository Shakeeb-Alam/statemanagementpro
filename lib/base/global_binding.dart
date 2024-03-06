import 'package:get/get.dart';
import 'package:statemanagement/controllers/auth_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}