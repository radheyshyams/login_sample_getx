import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_sample/routes/app_pages.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login App',
      initialRoute: AppPages.INITIAL, // Use the initial route from AppPages
      getPages: AppPages.routes,       // Use the defined routes
    );
  }
}
