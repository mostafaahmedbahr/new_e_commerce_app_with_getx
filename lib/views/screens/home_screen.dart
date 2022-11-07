import 'package:flutter/material.dart';
import 'package:get/get.dart';
   import 'package:new_e_commerce_app/views/widgets/home/card_items.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';


import '../../utils/theme.dart';
import '../widgets/home/search_text_form.dart';
class HomeScreen extends StatelessWidget {
    HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body:  Column(
             children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color:Get.isDarkMode?darkGreyClr: mainColor,
                  borderRadius:const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      const TextUtils(
                        text: "Find Your",
                        underLine: TextDecoration.none,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5,),
                      const TextUtils(
                        text: "INSPIRATION",
                        underLine: TextDecoration.none,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                       const SizedBox(height: 20,),
                      SearchTextForm(),
                     ],

                  ),
                ),
              ),
               const SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     TextUtils(
                       text: "Categories",
                       underLine: TextDecoration.none,
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       color:Get.isDarkMode?Colors.white:darkGreyClr,
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 30,),
               CardItems(),
               // CardItems(),
            ],
          ),
      ),
    );
  }
}
