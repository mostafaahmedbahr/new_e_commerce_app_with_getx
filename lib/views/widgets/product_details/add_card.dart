import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';

import '../../../models/product_model.dart';
class AddCard extends StatelessWidget {
  final double price;
  final ProductModels productModels;
    AddCard({
    required this.productModels,
    required this.price,
    Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
         children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const TextUtils(
                  text: "price",
                  underLine: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
              ),
              Text("\$ $price",
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 1.5,
              ),),
            ],
          ),
            const SizedBox(width: 20,),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: Get.isDarkMode? pinkClr : mainColor,
                  ),
                    onPressed: (){
                    controller.addProductToCart(productModels);
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  const [
                        Text("Add To Card",
                          style: TextStyle(
                            color:Colors.white ,
                             fontSize: 20,

                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
