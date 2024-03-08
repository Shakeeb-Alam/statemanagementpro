import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controllers/auth_controller.dart';
import 'package:statemanagement/controllers/covid-controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<CovidController>(CovidController());


  }

}