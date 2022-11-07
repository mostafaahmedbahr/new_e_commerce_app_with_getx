import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';

import '../../../routes/routes.dart';
 class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode?Colors.white:Colors.black,
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                  text: "Your Cart Is",
                  underLine: TextDecoration.none,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Get.isDarkMode?Colors.white:Colors.black ,
              ),
              TextUtils(
                text: " Empty",
                underLine: TextDecoration.none,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:Get.isDarkMode?pinkClr:mainColor,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          TextUtils(
            text: "Add Items to Get Started",
            underLine: TextDecoration.none,
            fontSize: 25,
            fontWeight: FontWeight.normal,
            color:Get.isDarkMode?pinkClr:mainColor,
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: AuthButton(
                width: double.infinity,
                text: "Go To Home",
                onPressed: (){
                  Get.toNamed(Routes.mainscreen);
                },
            ),
          ),
        ],
      ),
    );
  }
}
