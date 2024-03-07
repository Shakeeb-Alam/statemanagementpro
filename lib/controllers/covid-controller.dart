import 'dart:developer';

import 'package:get/get.dart';
import 'package:statemanagement/api/covid_api.dart';
import 'package:statemanagement/domain/covid_model.dart';

class CovidController extends GetxController {
  CovidReport covidReport = CovidReport();
  bool isLoading = false;

  void setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  Future<void> getCovidData(String data) async {
    setLoading(true);
    try {
      covidReport = await CovidApi().getData(data);
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

// Future<void> login(String email, String password) async {
//   setLoading(true);
//   try {
//     loginModel = await AuthApi().postData(email, password);
//   } catch (e) {
//     print(e.toString());
//   } finally {
//     setLoading(false);
//   }
// }
}

// class AuthController extends GetxController {
//   bool isLoading = false;
//   LoginModel loginModel = LoginModel();
//
//   void setLoading(bool loading) {
//     isLoading = loading;
//     update();
//   }
//
//   Future<void> login(String email, String password) async {
//     setLoading(true);
//     try {
//       loginModel = await AuthApi().postData(email, password);
//     } catch (e) {
//       print(e.toString());
//     } finally {
//       setLoading(false);
//     }
//   }
// }
