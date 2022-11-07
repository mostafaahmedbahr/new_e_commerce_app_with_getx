import 'package:get/get.dart';
import 'package:new_e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:new_e_commerce_app/logic/bindings/main_binding.dart';
import 'package:new_e_commerce_app/logic/controllers/product_controller.dart';
import 'package:new_e_commerce_app/views/screens/auth/forgetpassword_screen.dart';
import 'package:new_e_commerce_app/views/screens/auth/login_screen.dart';
import 'package:new_e_commerce_app/views/screens/auth/signup_screen.dart';
import 'package:new_e_commerce_app/views/screens/cart_screen.dart';
import 'package:new_e_commerce_app/views/screens/main_screen.dart';
import 'package:new_e_commerce_app/views/screens/welcome_screen.dart';

import '../logic/bindings/product_binding.dart';

class AppRoutes
{
  //initialScreen
  static var welcome =Routes.welcomeScreen;
  static var mainScreen = Routes.mainscreen;

  //pages
static final routes = [
  GetPage(name: Routes.welcomeScreen,
      page: ()=>const WelcomeScreen()),
  GetPage(name: Routes.loginScreen,
      page: ()=>  LoginScreen(),binding: AuthBinding()),
  GetPage(name: Routes.signUpScreen,
      page: ()=>  SignUpScreen(),binding: AuthBinding()),
  GetPage(name: Routes.forgetpasswordscreen,
      page: ()=>  ForgetPasswordScreen(),binding: AuthBinding()),
  GetPage(name: Routes.mainscreen,
      page: ()=>    MainScreen(),
      bindings:[
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
  ] ),
  GetPage(name: Routes.cartscreen,
      page: ()=>  CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
  ),
];
}

class Routes
{
  static const welcomeScreen = "/welcomeScreen";
  static const loginScreen = "/LoginScreen";
  static const signUpScreen = "/SignUpScreen";
  static const forgetpasswordscreen = "/forgetPasswordScreen";
  static const mainscreen = "/mainScreen";
  static const cartscreen = "/CartScreen";



}