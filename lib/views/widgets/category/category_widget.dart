import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/logic/controllers/catergory_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/category/category_item.dart';
  class CategoryWidget extends StatelessWidget {
  // final String image;
  // final ProductModels productModels;
    CategoryWidget({
    // required this.productModels,
    // required this.image,
    Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()
    {
      if(controller.isCategoryLoading.value)
      {
        return Center(
          child:  CircularProgressIndicator(
            color:Get.isDarkMode? pinkClr : mainColor,
          ),
        );
      }
      else
      {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context,index)
            {
              return InkWell(
                onTap: (){
                  controller.getAllCategorys(controller.categoryNameList[index]);
                  Get.to(()=>CategoryItems());
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image:   DecorationImage(
                      image: NetworkImage(
                        controller.imageCategory[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:  Padding(
                    padding:const EdgeInsets.only(
                      bottom: 10,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(controller.categoryNameList[index],
                        style:const TextStyle(
                          backgroundColor: Colors.black38,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context,index)
            {
              return const SizedBox(height: 20,);
            },
            itemCount: controller.categoryNameList.length,
          ),
        );
      }
    });
  }
}
