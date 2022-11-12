import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_e_commerce_app/models/facebook_model.dart';
import 'package:new_e_commerce_app/routes/routes.dart';

class AuthController extends GetxController{

  @override
  void onInit()
  {
    // signUpWithGoogle();
  }
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayName = "".obs;
  var displayEmail = "".obs;
  var displayphoto = "".obs;
  var isSignIn = false;
  FaceBookModel? faceBookModel;
  final GetStorage authStorage = GetStorage();

  void visibilityChange(){
    isVisibility = !isVisibility;
    update();
  }

  void checkBoxChange(){
    isCheckBox =!isCheckBox;
    update();
  }

  void signUpUsingFireBase({
  required String name,
    required String email,
    required String password,
}) async
  {
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        displayName.value = name;
        displayEmail.value = email;
        FirebaseAuth.instance.currentUser!.updateDisplayName(name);

        });
        update();
        Get.offNamed(Routes.mainscreen);
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code;
      if (error.code == 'weak-password') {
       message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      else
      {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
           "Error !",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }


  Future<void> loginUsingFireBase({
  required String email,
    required String password,
})
  async {
    try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:email,
          password: password,
      ).then((value){
          displayName.value = FirebaseAuth.instance.currentUser!.displayName!;
          displayEmail.value = FirebaseAuth.instance.currentUser!.email!;
        });
        isSignIn=true;
        authStorage.write("auth", isSignIn);
        update();
        Get.offNamed(Routes.mainscreen);

    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code;
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      else
      {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error !",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }


  void restPassword(String email) async
  {
    try {
    await  FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code;
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      }
      else
      {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error !",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void signUpWithGoogle() async
  {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayName.value = googleUser!.displayName!;
      displayEmail.value = googleUser.email;
      displayphoto.value = googleUser.photoUrl!;
      GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken:  googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      isSignIn=true;
      update();
      Get.offNamed(Routes.mainscreen);
    }catch(error)
    {
      Get.snackbar(
        "Error !",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }

  void signUpWithFacebook()async
  {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if(loginResult.status == LoginStatus.success )
    {
      var data =await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      print(faceBookModel?.name);
      print("000000000000");
      Get.offNamed(Routes.mainscreen);
      update();
    }


  }
  void signOutFromApp()async
  {
    try
    {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      displayName.value = "";
      displayphoto.value = "";
      displayEmail.value = "";
      isSignIn=false;
      authStorage.remove("auth");
      update();
      Get.offNamed(Routes.welcomeScreen);
    }catch(error)
    {
      Get.snackbar(
        "Error !",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}