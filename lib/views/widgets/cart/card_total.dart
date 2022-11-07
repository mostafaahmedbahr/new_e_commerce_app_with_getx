import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';

import '../../../logic/controllers/cart_controller.dart';
class CardTotal extends StatelessWidget {
    CardTotal({Key? key}) : super(key: key);
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        padding: EdgeInsets.only(bottom: 30,left: 30),
        child: Row(
          children: [
            Column(
              children: [
                TextUtils(
                  text: "Total",
                  underLine: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color:Get.isDarkMode?Colors.white : Colors.black,
                ),
                Text("\$ ${controller.total}",
                  style: TextStyle(
                    height: 1.5,
                    fontSize:25,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: AuthButton(
                    width: double.infinity,
                    text: "Check Out",
                    onPressed: (){},
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
