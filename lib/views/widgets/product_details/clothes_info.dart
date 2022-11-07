import 'package:flutter/material.dart';
 import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/product_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
 import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart' as prefix;
import 'package:readmore/readmore.dart';


class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
    ClothesInfo({Key? key,
      required this.description,
      required this.rate,
    required this.title,
      required this.productId
     }) : super(key: key);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                style:  TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode? Colors.white : Colors.black,
                ),),
              ),
             Obx((){
               return  Container(
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   color: Get.isDarkMode?
                   Colors.white.withOpacity(0.9) : Colors.grey.withOpacity(0.4),
                   shape: BoxShape.circle,
                 ),
                 child: InkWell(
                   onTap: (){
                     controller.manageFav(productId);
                   },
                   child: controller.isFav(productId)?
                   const Icon(Icons.favorite,
                     color: Colors.red,
                     size: 20,) :  const Icon(Icons.favorite_outline,
                     color: Colors.black,
                     size: 20,),
                 ),
               );
             }),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: rate.toString(),
                  underLine: TextDecoration.none,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode? Colors.white :Colors.black,
              ),
              const SizedBox(width: 8,),
              prefix.RatingBar(
                rating: rate,
                icon:const Icon(
                  Icons.star,
                  size:20,
                  color: Colors.grey,
                ),
                starCount: 5,
                spacing: 1,
                size: 20,
                isIndicator: false,
                allowHalfRating: true,
                onRatingCallback: (value,isIndictor)
                {
                  isIndictor.value==true;
                },
                color: Colors.orangeAccent,
              )
            ],
          ),
          const SizedBox(height: 20,),
          ReadMoreText(description,
          trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? pinkClr :mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? pinkClr :mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
               color: Get.isDarkMode? Colors.white :Colors.black,
            ),

          ),
        ],
      ),
    );
  }
}
