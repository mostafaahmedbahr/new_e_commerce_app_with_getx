import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_e_commerce_app/views/widgets/payment/payment_method_widget.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';

import '../../utils/theme.dart';
import '../widgets/payment/delevary_container_widget.dart';
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
          centerTitle: true,
          title: const Text("Payment Screen"),
        ),
        body:SingleChildScrollView(
          padding:const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Shipping to",
                  underLine: TextDecoration.none,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 20,),
              DelivaryContainerWidget(),
              const SizedBox(height: 20,),
              TextUtils(
                text: "Payment Method",
                underLine: TextDecoration.none,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 20,),
              // PayMentMethodWidget(),
              const SizedBox(height: 30,),
              Center(
                child: TextUtils(
                  text: "Total 200\$",
                  underLine: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
