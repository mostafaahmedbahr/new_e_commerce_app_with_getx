import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';

import '../../logic/controllers/main_controller.dart';
import '../../routes/routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
              elevation: 0,
              actions: [
                Obx(()=>Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent:   Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child:  IconButton(onPressed: (){
                    Get.toNamed(Routes.cartscreen);
                  },
                    icon: Image.asset("assets/images/shop.png"),
                  ),
                ),),

        ],
        title: Text(controller.titles[controller.currentIndex.value]),
        centerTitle: true,
        backgroundColor:Get.isDarkMode? darkGreyClr:mainColor,
        ),
        body: IndexedStack(
        index: controller.currentIndex.value,
        children: controller.tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor:Get.isDarkMode? darkGreyClr:Colors.white,
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Get.isDarkMode?pinkClr:mainColor,
        unselectedItemColor: Get.isDarkMode?Colors.grey:darkGreyClr,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
        controller.currentIndex.value = index;
        },
        items: [
        BottomNavigationBarItem(

        icon: Icon(Icons.home,
        color:Get.isDarkMode?pinkClr:mainColor),
        label: "Home",
        ),
        BottomNavigationBarItem(

        icon: Icon(Icons.category,
        color:Get.isDarkMode? pinkClr:mainColor),
        label: "Category",
        ),
        BottomNavigationBarItem(

        icon: Icon(Icons.favorite,
        color:Get.isDarkMode? pinkClr:mainColor),
        label: "Favorite",
        ),
        BottomNavigationBarItem(

        icon: Icon(Icons.settings,
        color:Get.isDarkMode? pinkClr:mainColor),
        label: "Settings",
        ),

        ]
        ,
        )
        ,
        );
      }),
    );
  }
}
