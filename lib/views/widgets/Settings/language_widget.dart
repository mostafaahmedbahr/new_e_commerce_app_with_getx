import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/setting_controller.dart';
import 'package:new_e_commerce_app/utils/my_strings.dart';

import '../../../utils/theme.dart';
import '../text.dart';
class LanguageWidget extends StatelessWidget {
    LanguageWidget({Key? key}) : super(key: key);
final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (context)
    {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Container(
            width: 120,
            height: 50,
            padding:const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 6
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color:Get.isDarkMode ? Colors.white: Colors.black,
              ),
            ),
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(Icons.arrow_drop_down ,color :
              Get.isDarkMode ? Colors.white : Colors.black,),
              underline: Container(),
              items: [
                DropdownMenuItem(
                  child: TextUtils(
                    color: Get.isDarkMode ? Colors.white: Colors.black,
                    fontWeight: FontWeight.bold,
                    text: arabic,
                    fontSize: 16,
                    underLine: TextDecoration.none,
                  ),
                  value:ara,
                ),
                DropdownMenuItem(
                  child: TextUtils(
                    color: Get.isDarkMode ? Colors.white: Colors.black,
                    fontWeight: FontWeight.bold,
                    text: english,
                    fontSize: 16,
                    underLine: TextDecoration.none,
                  ),
                  value: ene,
                ),
                DropdownMenuItem(
                  child: TextUtils(
                    color: Get.isDarkMode ? Colors.white: Colors.black,
                    fontWeight: FontWeight.bold,
                    text: french,
                    fontSize: 16,
                    underLine: TextDecoration.none,
                  ),
                  value: frf,
                ),

              ],
              onChanged: (value){
                controller.changeLang(value);
                Get.updateLocale(Locale(value!));
              },
              value: controller.localeLang,

            ),
          ),
        ],
      );
    });
  }
  buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding:const EdgeInsets.all(6),
            decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              color: languageSettings,
            ),
            child: const Icon(Icons.language,
              color: Colors.white,),
          ),
          const SizedBox(width: 20,),
          TextUtils(
            text: "Language".tr,
            underLine: TextDecoration.none,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white: Colors.black,
          ),
        ],
      ),
    );
  }
}
