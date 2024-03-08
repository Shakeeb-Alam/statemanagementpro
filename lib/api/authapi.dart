import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:statemanagement/presentation/covid-screen.dart';

import '../Domain/login_model.dart';

class AuthApi {
  Future<LoginModel> postData(String email, password) async {
    try {
      log(email);
      log(password);

      http.Response endpoint =
          await http.post(Uri.parse('http://138.68.172.242/api/login'), body: {
        'email': email,
        'password': password,
      });
      print(endpoint.statusCode);
      // http.Response response = await http.post(endpoint);
      if (endpoint.statusCode == 200) {
        //LoginModel data = jsonDecode(response.body);
        LoginModel data = LoginModel.fromJson(jsonDecode(endpoint.body));
        print(data.toJson());
        Get.to(() => const CovidScreen());
        return data;
        // print(data);
        print('Successfully');
      } else {
        Get.rawSnackbar(title: 'Wrong ', message: 'login Failed');
        log('No Data');
        return LoginModel();
      }
    } catch (e) {
      Get.rawSnackbar(
        title: 'Error',
        message: e.toString(),
      );
      log(e.toString());
      rethrow;
    }
  }

  Future<UserCredential> loginWithFirebase(String email, password) async {
    FirebaseAuth firebase = FirebaseAuth.instance;
    try {
      UserCredential response = await firebase.signInWithEmailAndPassword(
          email: email, password: password);
      print(response.toString());
      Get.to(() => const CovidScreen());
      return response;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      throw Exception('Error');
    } catch (e) {
      Get.rawSnackbar(
        title: 'Error',
        message: e.toString(),
      );
      log(e.toString());
      rethrow;
    }
  }
  Future<UserCredential> signupWithFirebase(String email, password) async {
    FirebaseAuth firebase = FirebaseAuth.instance;
    try {
      UserCredential response = await firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      print(response.toString());
      Get.to(() => const CovidScreen());
      return response;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      throw Exception('Error');
    } catch (e) {
      Get.rawSnackbar(
        title: 'Error',
        message: e.toString(),
      );
      log(e.toString());
      rethrow;
    }
  }
}
