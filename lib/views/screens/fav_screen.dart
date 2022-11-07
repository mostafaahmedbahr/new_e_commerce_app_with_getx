import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/models/product_model.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';

import '../../logic/controllers/product_controller.dart';
class FavScreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:Obx((){
        if(controller.favList.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                    width: 150,
                    child: Image.asset("assets/images/heart.png")),
                const SizedBox(height: 20,),
                Text("Please , Add your favorites products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white:Colors.black,
                ),),
              ],
            ),
          );
        }
        else
        {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              itemBuilder: (context,index){
                return buildFavItem(
                  image: controller.favList[index].image,
                  price: controller.favList[index].price,
                  title: controller.favList[index].title,
                  productId: controller.favList[index].id,

                );
              },
              separatorBuilder: (context,index){
                return const Divider(
                  color: Colors.grey,
                );
              },
              itemCount: controller.favList.length,
            ),
          );
        }
      }),


    );
  }

  Widget buildFavItem({
  required String image,
    required double price,
    required String title,
    required int productId,
})
  {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
         children: [
            SizedBox(
            height: 100,
            width: 120,
            child: Image(
              image: NetworkImage(image),
             ),
          ),
           const SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color:Get.isDarkMode? Colors.white:Colors.black,
                    ),

                ),
                  SizedBox(height: 7,),
                  Text(price.toString(),
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color:Colors.grey,
                  ),

                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: (){
                controller.manageFav(productId);
              },
              icon: Icon(Icons.favorite,
              size: 40,
              color: Colors.red,
              ),
          ),

        ],
      ),
    );
  }
}
