import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class CheckWidget extends StatelessWidget {
    CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (context){
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBoxChange();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child:controller.isCheckBox? Get.isDarkMode?
              const Icon(Icons.done,
                color: pinkClr,
                size: 30,):Image.asset("assets/images/check.png"):Container(),
            ),

          ),
          const SizedBox(width: 10,),
          Row(
            children:  [
              TextUtils(
                text: "I accept ",
                underLine: TextDecoration.none,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color:Get.isDarkMode?Colors.white: Colors.black,
              ),
              TextUtils(
                text: "terms & conditions",
                underLine: TextDecoration.underline,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode?Colors.white: Colors.black ,
              ),
            ],
          ),
        ],
      );
    });
  }
}
