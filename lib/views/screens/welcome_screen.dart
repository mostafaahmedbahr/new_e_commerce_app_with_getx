import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_e_commerce_app/routes/routes.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Stack(
           children: [
             SizedBox(
               height: double.infinity,
               width: double.infinity,
               child: Image.asset("assets/images/background.png",
               fit: BoxFit.cover,),
             ),
             Container(
               color: Colors.black.withOpacity(0.2),
               width: double.infinity,
               height: double.infinity,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 100,),
                   Container(
                     height: 60,
                     width: 190,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.black.withOpacity(0.3),
                     ),
                     child: TextUtils(
                       underLine: TextDecoration.none,
                       fontSize: 35,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       text: "Welcome",
                     ),
                   ),
                   SizedBox(height: 10,),
                   Container(
                     height: 60,
                     width: 240,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.black.withOpacity(0.3),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         TextUtils(
                           fontSize: 35,
                           color:Get.isDarkMode?pinkClr: mainColor,
                           fontWeight: FontWeight.bold,
                           text: "Asroo",
                           underLine: TextDecoration.none,
                         ),
                         SizedBox(width: 7,),
                         TextUtils(
                           underLine: TextDecoration.none,
                           fontSize: 35,
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           text: "Shop",
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 250,),
                   AuthButton(
                     width: 200,
                       text: "Get Started",
                       onPressed: (){
                         Get.offNamed(Routes.loginScreen);
                       },
                   ),
                   SizedBox(height: 30,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       TextUtils(
                           text: "Don\'t have an account?",
                           fontSize: 18,
                           fontWeight: FontWeight.normal,
                           color: Colors.white,
                         underLine: TextDecoration.none,
                       ),
                       TextButton(
                         onPressed: (){
                           Get.offNamed(Routes.signUpScreen);
                         },
                         child: TextUtils(
                           text: "Sign Up",
                           fontSize: 18,
                           fontWeight: FontWeight.normal,
                           color: Colors.white,
                           underLine: TextDecoration.underline,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),

           ],
         ),
      ),
    );
  }
}
