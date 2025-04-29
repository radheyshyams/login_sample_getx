import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: controller.validateEmail,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: controller.validatePassword,
                ),

                SizedBox(height: 30.0),
                Obx(() => ElevatedButton(
                    onPressed: controller.isFormValid.value ? () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.login();
                      }
                    } : null,
                    child: controller.isLoading.value ? CircularProgressIndicator() : Text('Login'),
                  ),
                ),
                SizedBox(height: 10.0),
                Obx(() => controller.errorMessage.value != null
                      ? Text(
                    controller.errorMessage.value!,
                    style: TextStyle(color: Colors.red),
                  ) : SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}