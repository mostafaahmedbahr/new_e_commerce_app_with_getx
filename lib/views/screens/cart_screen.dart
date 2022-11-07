 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/cart/empty_cart.dart';

import '../../routes/routes.dart';
import '../widgets/cart/card_total.dart';
import '../widgets/cart/cart_product_card.dart';
class CartScreen extends StatelessWidget {
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
            centerTitle: true,
            title: const Text("Cart Items"),
            actions: [
              IconButton(
                onPressed: (){
                  Get.defaultDialog(
                    title: "clear products",
                    middleText: "Are You sure you need to clear products !",
                    textCancel: "No",
                    cancelTextColor:Get.isDarkMode?Colors.white: Colors.black,
                    textConfirm: "yes",
                    onCancel: (){
                     Get.toNamed(Routes.cartscreen);
                    },
                    onConfirm: ()
                    {
                      controller.clearAllProducts();
                      Get.back();
                     },
                    buttonColor: Get.isDarkMode?pinkClr:mainColor,

                  );

                },
                  icon: const Icon(Icons.backspace,
                  ),),
            ],
          ),
          body: Obx(()
          {
            if(controller.productsMap.isEmpty)
            {
              return EmptyCart();
            }
            else
            {
              return SingleChildScrollView(
                child: Column(
                  children:    [
                    SizedBox(height: 600,
                      child: ListView.separated(
                        itemBuilder: (context,index){
                          return CartProductCard(
                            numberOfProduct: controller.productsMap.values.toList()[index],
                            index: index,
                            productModels: controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 20,);
                        },
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30
                      ),
                      child: CardTotal(),
                    ),
                  ],
                ),
              );
            }

          }),
        ),
    );
  }
}
