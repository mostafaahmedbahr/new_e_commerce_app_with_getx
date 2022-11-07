import 'package:get/get.dart';
import 'package:new_e_commerce_app/logic/controllers/main_controller.dart';

import '../controllers/setting_controller.dart';

class MainBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
   }

}