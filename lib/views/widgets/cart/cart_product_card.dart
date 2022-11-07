import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/models/product_model.dart';
import 'package:new_e_commerce_app/utils/theme.dart';

import '../../../logic/controllers/cart_controller.dart';
class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int numberOfProduct;
    CartProductCard({
      required this.numberOfProduct,
      required this.index,
      required this.productModels,
})  ;
  final controller = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color:Get.isDarkMode?pinkClr.withOpacity(0.7) :mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image:   DecorationImage(
                image: NetworkImage(productModels.image),
                fit: BoxFit.cover,
              )
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModels.title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color:Get.isDarkMode?Colors.white: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                Text("\$ ${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color:Get.isDarkMode?Colors.white: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    controller.addProductToCart(productModels);
                  },
                    icon: Icon(Icons.add_circle,),
                  ),
                  Text("$numberOfProduct",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color:Get.isDarkMode?Colors.white: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  IconButton(onPressed: (){
                    controller.removeProductsFromCart(productModels);
                  },
                      icon: Icon(Icons.remove_circle,),
                  ),
                ],
              ),
              IconButton(
                onPressed:(){
                  controller.removeOneProduct(productModels);
                },
                  icon: Icon(Icons.delete,
                  color: Get.isDarkMode?Colors.black:Colors.red,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
