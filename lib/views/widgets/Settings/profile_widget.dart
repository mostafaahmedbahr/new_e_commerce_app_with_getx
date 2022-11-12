import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/logic/controllers/setting_controller.dart';
 import 'package:new_e_commerce_app/views/widgets/text.dart';
class ProfileWidget extends StatelessWidget {
    ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();
    final authController = Get.find<AuthController>();

    @override
  Widget build(BuildContext context) {
    return Obx(()
    {
      return Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration:const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage("https://img.freepik.com/premium-vector/person-says-no-with-gesture-denial-expression-angry-grumpy-prohibition_313437-745.jpg?w=740"),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: controller.capetalize(authController.displayName.value),
                    underLine: TextDecoration.none,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  TextUtils(
                    text: authController.displayEmail.toString(),
                    underLine: TextDecoration.none,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
