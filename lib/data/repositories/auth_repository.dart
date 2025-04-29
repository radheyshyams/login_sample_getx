import 'package:get/get.dart';
import '../providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider authProvider = Get.find<AuthProvider>();

  Future<Response> login(String email, String password) async {
    return await authProvider.login(email, password);
  }
}