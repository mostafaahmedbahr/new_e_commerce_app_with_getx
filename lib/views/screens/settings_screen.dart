import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/theme_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';

import '../../logic/controllers/auth_controller.dart';
class SettingsScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding:const EdgeInsets.all(24),
        children: [
          // ProfileImage(),
          const SizedBox(height: 10,),
          Divider(
            color:Get.isDarkMode ? Colors.white :  Colors.grey,
            thickness: 3,
          ),
          const SizedBox(height: 20,),
           TextUtils(
            text: "GENERAL",
            underLine: TextDecoration.none,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:Get.isDarkMode ? pinkClr : mainColor ,

        ),
          const SizedBox(height: 20,),
          // DarkModeWidget(),
          const SizedBox(height: 20,),
          // LanguageWidget(),
          const SizedBox(height: 20,),
          // LogOutScreen(),

        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: (){
      //           ThemeController().changeTheme();
      //         },
      //         child: Text("Dark Mode",
      //         style: TextStyle(
      //           color: Get.isDarkMode? Colors.white : Colors.black,
      //         ),),
      //       ),
      //       GetBuilder<AuthController>(builder: (context){
      //         return TextButton(
      //           onPressed: (){
      //             Get.defaultDialog(
      //               title: "LogOut From App",
      //               middleText: "Are You sure you nedd to LogOut !",
      //               textCancel: "No",
      //               cancelTextColor:Get.isDarkMode?Colors.white: Colors.black,
      //               textConfirm: "yes",
      //               onCancel: (){
      //                 Get.back();
      //               },
      //               onConfirm: ()
      //               {
      //                 controller.signOutFromApp();
      //               },
      //               buttonColor: Get.isDarkMode?pinkClr:mainColor,
      //
      //             );
      //           },
      //           child: Text("log Out",
      //             style: TextStyle(
      //               color: Get.isDarkMode? Colors.white : Colors.black,
      //             ),),
      //         );
      //       })
      //     ],
      //   ),
      // ),
    );
  }
}
