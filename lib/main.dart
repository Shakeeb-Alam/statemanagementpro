import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/base/global_binding.dart';
import 'package:statemanagement/firebase_options.dart';
import 'package:statemanagement/presentation/color_pixer_view.dart';
import 'package:statemanagement/presentation/color_screen.dart';
import 'package:statemanagement/presentation/login_screen.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ColorPickerView(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//    Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       // ),
//       home: Scaffold(
//           appBar: AppBar(
//             title:const Center(child: const Text("Color Designer")),
//           ),
//           body:  Column(
//             children: [
//               Expanded(
//                 child: RgbPicker(),
//               ),
//               Divider(thickness: 2),
//               // Expanded(
//               //   child: ControllerExample(),
//               // ),
//             ],
//           )),
//     );
  //   return GetMaterialApp(
  //     initialBinding: GlobalBinding(),
  //     debugShowCheckedModeBanner: false,
  //     home: const ExampleApp(),
  //   );
//   }
// }
