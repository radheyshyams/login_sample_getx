import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/auth_provider.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authProvider = Get.put(AuthProvider());
  final authRepository = Get.put(AuthRepository()); // Inject the repository


  final isLoading = false.obs;
  final errorMessage = RxnString();

  @override
  void onInit() {

    Get.put(AuthProvider()); // Initialize AuthProvider
    Get.put(AuthRepository()); // Initialize AuthRepository
    super.onInit();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  Future<void> login() async {
    if (validateEmail(emailController.text) != null ||
        validatePassword(passwordController.text) != null) {
      Get.snackbar('Error', 'Please fix the validation errors.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    errorMessage.value = null; // Clear any previous error

    final response = await authRepository.login(emailController.text, passwordController.text);

    isLoading.value = false;

    if (response.isOk) {
      // Assuming the response body contains 'accessToken'
      final accessToken = response.body['accessToken'];
      print('Login successful! Token: $accessToken');
      // Store the token securely (e.g., using a service)
      Get.offAllNamed('/home'); // Navigate to the home screen
    } else {
      errorMessage.value = response.body['error'] ?? 'Login failed. Please try again.';
      Get.snackbar('Login Failed', errorMessage.value!, snackPosition: SnackPosition.BOTTOM);
    }
  }



  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}