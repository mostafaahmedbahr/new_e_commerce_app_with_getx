import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_e_commerce_app/routes/routes.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;
  const AuthButton({
    required this.width,
    required this.text,
    required this.onPressed,
}) ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode? pinkClr:mainColor,
          maximumSize: const Size(360,50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed:onPressed,
        child: TextUtils(
          color: Colors.white,
          text: text,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          underLine: TextDecoration.none,
        ),

      ),
    );
  }
}
