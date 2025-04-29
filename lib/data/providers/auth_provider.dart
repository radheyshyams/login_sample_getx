import 'package:get/get.dart';
import '../../utils/constants.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    super.onInit();
  }

  Future<Response> login(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };
    return await post('/auth/login', body);
  }
}