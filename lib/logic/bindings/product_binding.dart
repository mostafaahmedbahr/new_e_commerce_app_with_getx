import 'package:get/instance_manager.dart';
import 'package:new_e_commerce_app/logic/controllers/catergory_controller.dart';

import '../controllers/cart_controller.dart';
import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
    // Get.lazyPut(() => CategoryController());
  }
}