import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:new_e_commerce_app/routes/routes.dart';
import 'package:new_e_commerce_app/utils/my_strings.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
 import 'package:new_e_commerce_app/views/widgets/auth/auth_button.dart';
import 'package:new_e_commerce_app/views/widgets/auth/auth_text_form_field.dart';
 import 'package:new_e_commerce_app/views/widgets/auth/container_under.dart';
import 'package:new_e_commerce_app/views/widgets/text.dart';
class LoginScreen extends StatelessWidget {
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:Get.isDarkMode? darkGreyClr:Colors.white,
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white ,
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
                    left: 25,right: 25,top: 40,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children:   [
                            TextUtils(
                              text: "LOG",
                              underLine: TextDecoration.none,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:Get.isDarkMode?pinkClr: mainColor,
                            ),
                            const SizedBox(width: 3,),
                            TextUtils(
                              text: "IN",
                              underLine: TextDecoration.none,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:Get.isDarkMode?Colors.white: Colors.black ,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
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
                            prefixIcon:Get.isDarkMode?
                            const Icon(Icons.lock,
                                size: 30,
                                color: pinkClr):Image.asset("assets/images/lock.png"),
                            suffixIcon:
                            IconButton(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed:(){
                                Get.toNamed(Routes.forgetpasswordscreen);
                              },
                                child: TextUtils(
                                  color:Get.isDarkMode? Colors.white:Colors.black,
                                  text: "forget password?",
                                  underLine: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        GetBuilder<AuthController>(builder:(context){
                          return AuthButton(
                            width: double.infinity,
                            onPressed: (){
                               if(formKey.currentState!.validate())
                               {
                                 String email = emailController.text;
                                 String password = passwordController.text;
                                 controller.loginUsingFireBase(
                                   email: email,
                                   password: password,
                                 );
                               }
                            },
                            text: "LOGIN",
                          );
                        }),
                        const SizedBox(height: 20,),
                        TextUtils(
                          color:Get.isDarkMode?Colors.white:Colors.black,
                          text:"OR",
                          underLine: TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){
                                controller.signUpWithFacebook();
                              },
                                child: Image.asset("assets/images/facebook.png")),
                            const SizedBox(width: 10,),
                            GetBuilder<AuthController>(builder: (context){
                              return InkWell(
                                  onTap:(){
                                    controller.signUpWithGoogle();
                                  },
                                  child: Image.asset("assets/images/google.png"));
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 20,),
              ContainerUnder(
                text1: "Don\'t have an account? ",
                text2: "Sign Up",
                onPressed: (){
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
