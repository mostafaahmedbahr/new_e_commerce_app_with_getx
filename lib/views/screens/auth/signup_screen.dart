import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/routes/routes.dart';
import 'package:new_e_commerce_app/utils/my_strings.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
 import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_text_form_field.dart';
import 'package:new_e_commerce_app/views/widgets/auth/check_widget.dart';
import 'package:new_e_commerce_app/views/widgets/auth/container_under.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

final controller = Get.find<AuthController>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:Get.isDarkMode? Colors.white:darkGreyClr,
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
         backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
         elevation: 0,
       ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height:MediaQuery.of(context).size.height/1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,right: 25,top: 20,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children:   [
                            TextUtils(
                                text: "Sign",
                                underLine: TextDecoration.none,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color:Get.isDarkMode?pinkClr: mainColor,
                            ),
                            const SizedBox(width: 3,),
                            TextUtils(
                              text: "Up",
                              underLine: TextDecoration.none,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:Get.isDarkMode?Colors.white: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        AuthTextFormField(

                          keyboardType: TextInputType.name,
                          controller: nameController,
                          obscureText: false,
                          validator: (value){
                             if(value.toString().length<=2||
                                 !RegExp(validationName).hasMatch(value))
                             {
                               return "enter valid name";
                             }
                             else
                             {
                               return null;
                             }
                          },
                          prefixIcon: Get.isDarkMode?
                          const Icon(Icons.person,
                            size: 30,
                            color: pinkClr,):Image.asset("assets/images/user.png"),
                          suffixIcon: const Text(""),
                          hintText: "User Name",
                        ),
                        const SizedBox(height: 15,),
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
                          prefixIcon:Get.isDarkMode? const Icon(Icons.email,
                            size: 30,
                            color:pinkClr,):Image.asset("assets/images/email.png"),
                          suffixIcon: const Text(""),
                          hintText: "E-Mail",
                        ),
                        const SizedBox(height: 15,),
                        GetBuilder<AuthController>(builder: (context){
                          return AuthTextFormField(

                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false :true,
                            validator: (value){
                              if(value.toString().length<6){
                                return "password should be longer than or equal 6 characters";
                              }
                              else{
                                return null;
                              }
                            },
                            prefixIcon:Get.isDarkMode? const Icon(Icons.lock,
                                size: 30,
                                color:pinkClr):Image.asset("assets/images/lock.png"),
                            suffixIcon: IconButton(
                              onPressed: (){
                                controller.visibilityChange();
                              },
                              icon:controller.isVisibility?
                              Icon(Icons.visibility,
                                color: Get.isDarkMode?Colors.black: Colors.green,): Icon(Icons.visibility_off,
                                color: Get.isDarkMode?Colors.black: Colors.green,),
                            ),
                            hintText: "PassWord",
                          );
                        }),
                        const SizedBox(height: 20,),
                        CheckWidget(),
                        const SizedBox(height: 20,),
                       GetBuilder<AuthController>(builder:(context){
                         return  AuthButton(
                           width: double.infinity,
                           onPressed: () {
                             if(controller.isCheckBox==false)
                             {
                               Get.snackbar(
                                   "Check Box",
                                   "Please, accept terms and conditions",
                                 snackPosition: SnackPosition.BOTTOM,
                                 colorText: Colors.white,
                                 backgroundColor: Colors.grey,
                               );
                             }
                             else{
                               if(formKey.currentState!.validate())
                               {
                                 //trim تشيل المسافات على اليمين والشمال
                                 String email = emailController.text.trim();
                                 String password = passwordController.text;
                                 String name = nameController.text.trim();
                                 controller.signUpUsingFireBase(
                                   email: email,
                                   password: password,
                                   name: name,
                                 );
                               }

                             }

                           },
                           text: "SIGN UP",
                         );
                       }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ContainerUnder(
                text1: "Already have an Account ? ",
                text2: "Log in",
                onPressed: (){
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
