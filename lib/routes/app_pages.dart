
import 'package:get/get.dart';
import 'package:login_sample/module/home/views/home_screen.dart';
import 'package:login_sample/module/login/views/login_screen.dart';
import '../module/home/bindings/home_binding.dart';
import '../module/login/bindings/login_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(), // Assuming you create a HomeView
      binding: HomeBinding(), // Assuming you create a HomeBinding
    ),
  ];
}