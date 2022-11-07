import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/utils/my_strings.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_text_form_field.dart';
class ForgetPasswordScreen extends StatelessWidget {
    ForgetPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final controller = Get.find<AuthController>();


    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:Get.isDarkMode? Colors.white:Colors.black,
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode?Colors.black: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text("Forget Password",
          style: TextStyle(
            color: Get.isDarkMode?pinkClr:mainColor,
          ),),
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,
            color: Get.isDarkMode?Colors.white: Colors.black,),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: Icon(Icons.clear,
                      color:Get.isDarkMode?Colors.black: Colors.white,),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text("If you want to recover your account,then please provide your email ID below ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:Get.isDarkMode?Colors.white:Colors.black,
                  ),),
                  Image.asset("assets/images/forgetpass copy.png",
                  width: 300,
                  ),
                  const SizedBox(height: 20,),
                  AuthTextFormField(

                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    obscureText: false,
                    validator: (value){
                      if(!RegExp(validationEmail).hasMatch(value))
                      {
                        return "enter valid email";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    prefixIcon:Get.isDarkMode?
                    const Icon(Icons.email,
                      size: 30,
                      color:pinkClr,):Image.asset("assets/images/email.png"),
                    suffixIcon: const Text(""),
                    hintText: "E-Mail",
                  ),
                  const SizedBox(height: 20,),
                  GetBuilder<AuthController>(builder: (context){
                    return AuthButton(
                      width: double.infinity,
                      text: "Send",
                      onPressed: (){
                        if(formKey.currentState!.validate())
                        {
                          controller.restPassword(emailController.text.trim());
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
