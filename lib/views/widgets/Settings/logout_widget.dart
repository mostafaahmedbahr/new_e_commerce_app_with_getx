import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';

import '../text.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_)
    {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "LogOut From App",
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              middleText: "Are You sure you nedd to LogOut !",
              middleTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              radius: 10,
              backgroundColor: Colors.grey,
              textCancel: "No",
              cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              textConfirm: "yes",
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            );
          },
          splashColor: Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.4),
          customBorder: const StadiumBorder(),
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.login_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                text: "Logout".tr,
                underLine: TextDecoration.none,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      );
    });
  }
}
