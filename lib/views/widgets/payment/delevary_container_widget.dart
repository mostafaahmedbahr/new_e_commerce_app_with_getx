import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/logic/controllers/payment_controller.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class DelivaryContainerWidget extends StatefulWidget {
  const DelivaryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DelivaryContainerWidget> createState() => _DelivaryContainerWidgetState();
}

class _DelivaryContainerWidgetState extends State<DelivaryContainerWidget> {
  int radioIndex = 1;
bool  changeColor = false;
var phoneCon = TextEditingController();
final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          icon: Container(),
            color: changeColor ? Colors.white : Colors.grey,
          onChange: (int? value)
          {
            setState(() {
              radioIndex = value!;
              changeColor = !changeColor;
            });
          },
          value: 1,
          name: 'Mostafa Ahmed',
          address: 'giza - faisal',
          phone: '01110690299',
          title: 'Flutter',

        ),
      const  SizedBox(height: 10,),
        Obx((){
          return buildRadioContainer(
            color: changeColor ? Colors.grey : Colors.white,
            onChange: (int? value)
            {
              setState(() {
                radioIndex = value!;
                changeColor = !changeColor;
              });
              controller.updatePosition();
            },
            value: 2,
            name: authController.displayName.value,
            address: controller.address.value,
            phone: controller.phoneNumber.value,
            title: 'Dart',
            icon:  InkWell(
              onTap: (){
                Get.defaultDialog(
                  title: "Enter phone number ",
                  titleStyle:const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  radius: 10,
                  backgroundColor: Colors.white,
                  textCancel: "cancel",
                  cancelTextColor: Colors.black,
                  confirmTextColor: Colors.white,
                  textConfirm: " save ",
                  onCancel: (){
                    Get.back();
                  },
                  onConfirm: (){
                    Get.back();
                    controller.phoneNumber.value = phoneCon.text;
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      maxLength: 11,
                      controller: phoneCon,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      onSubmitted: (value){
                        phoneCon.text = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode ? pinkClr.withOpacity(0.2) : mainColor.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon:    Icon(Icons.phone,
                          color:Get.isDarkMode ? pinkClr : mainColor,),
                        suffixIcon: IconButton(
                          onPressed: (){
                            phoneCon.clear();
                          },
                          icon:const Icon(Icons.close,
                            color: Colors.black,),
                        ),
                        filled: true,
                        hintText: "Enter Phone Number",
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
                    ),),


                );
              },
              child: Icon(Icons.contact_phone_outlined,
                color: Get.isDarkMode ? pinkClr : mainColor,),
            ),
          );
        }),
      ],
    );
  }

  buildRadioContainer({
    required Color color,
    required int value,
    required Function onChange,
    required String name,
    required String title,
    required String phone ,
    required String address,
    required Widget icon,
}) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius:3.0 ,
            blurRadius: 5.0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
              value: value,
              groupValue: radioIndex,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              onChanged: (val)
              {
                onChange(val);
              },
          ),
        const  SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: title,
                    underLine: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                ),
                const  SizedBox(height: 5,),
                TextUtils(
                  text: name,
                  underLine: TextDecoration.none,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const  SizedBox(height: 5,),
                Row(
                  children: [
                    const Text("🇪🇬 +20 "),
                    TextUtils(
                      text: phone,
                      underLine: TextDecoration.none,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    const  SizedBox(width: 50,),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const  SizedBox(height: 5,),
                TextUtils(
                  text: address,
                  underLine: TextDecoration.none,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
