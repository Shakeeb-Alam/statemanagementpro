import 'package:get/get.dart';
import 'package:statemanagement/Domain/login_model.dart';
import 'package:statemanagement/api/authapi.dart';

class AuthController extends GetxController {
  bool isLoading = false;
  LoginModel loginModel = LoginModel();

  void setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      loginModel = await AuthApi().postData(email, password);
    } catch (e) {
      print(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
