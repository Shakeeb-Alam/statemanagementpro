import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:statemanagement/base/global_binding.dart';
import 'package:statemanagement/presentation/getmaterial.dart';
import 'package:statemanagement/presentation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GlobalBinding(),
      home: const Homeview(),
    );
  }
}
