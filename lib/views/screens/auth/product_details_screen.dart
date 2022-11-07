import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/models/product_model.dart';

import '../../widgets/product_details/add_card.dart';
import '../../widgets/product_details/clothes_info.dart';
import '../../widgets/product_details/image_slider.dart';
import '../../widgets/product_details/size_list.dart';
class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({
    required this.productModels,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(imageUrl: productModels.image,),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate:  productModels.rating.rate,
                description: productModels.description,
              ),
              const SizeList(),
              AddCard(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
