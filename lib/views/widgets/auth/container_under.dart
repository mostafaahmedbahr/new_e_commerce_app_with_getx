import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class ContainerUnder extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onPressed;
  const ContainerUnder({
    required this.text1,
    required this.text2,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode? pinkClr:mainColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text1,
              underLine: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
              child:  TextUtils(
                text: text2,
                underLine: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}
