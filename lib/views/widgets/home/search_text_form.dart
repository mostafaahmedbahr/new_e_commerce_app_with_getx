import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:new_e_commerce_app/logic/controllers/product_controller.dart';

 class SearchTextForm extends StatelessWidget {
    SearchTextForm({Key? key}) : super(key: key);
  // final TextEditingController searchController = TextEditingController();
final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder:(context){
      return TextField(
        controller: controller.searchController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (searchName){
          controller.addToSearchList(searchName);
        },
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          focusColor: Colors.red,
          prefixIcon:  const Icon(Icons.search,
          color: Colors.grey,),
          suffixIcon:controller.searchController.text.isNotEmpty?
          IconButton(
            icon:const Icon(Icons.close,
              color: Colors.black,),
             onPressed: () {
              controller.clearSearch();
             },):null,
          filled: true,
          hintText: "Search",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }
}

// AuthTextFormField(
// keyboardType: TextInputType.text,
// hintText: "Search",
// prefixIcon:   Icon(Icons.search,
// color: Get.isDarkMode?pinkClr:mainColor,),
// validator: (value){},
// obscureText: false,
// suffixIcon: IconButton(
// onPressed:(){
// controller.clearSearch();
// },
// icon: const Icon(Icons.close),
// color: Get.isDarkMode?pinkClr:mainColor,
// ),
// )