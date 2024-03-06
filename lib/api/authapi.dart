import 'dart:convert';

import 'package:http/http.dart';

import '../Domain/login_model.dart';

class AuthApi{
  Future<LoginModel>  postData(String email, password) async {
    try {
      print(email);
      print(password);

      Response endpoint =
      await post(Uri.parse('http://138.68.172.242/api/login'), body: {
        'email': email,
        'password': password,
      });
      print(endpoint.statusCode);
      // http.Response response = await http.post(endpoint);
      if (endpoint.statusCode == 200) {
        //LoginModel data = jsonDecode(response.body);
        LoginModel data = LoginModel.fromJson(jsonDecode(endpoint.body));
        print(data.toJson());

        return data;
        print(data);
        print('Successfully');
      } else {
        print('No Data' );
        return LoginModel();
      }
    } catch (e) {

      print(e.toString());
      rethrow;
    }
  }

}