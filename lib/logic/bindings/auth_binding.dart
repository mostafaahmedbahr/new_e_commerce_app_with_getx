import 'package:get/get.dart';
import 'package:new_e_commerce_app/logic/controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
   }

}