import 'package:get/get.dart';
import 'package:new_e_commerce_app/views/screens/category_screen.dart';
import 'package:new_e_commerce_app/views/screens/fav_screen.dart';
import 'package:new_e_commerce_app/views/screens/home_screen.dart';
import 'package:new_e_commerce_app/views/screens/settings_screen.dart';

class MainController extends GetxController{
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavScreen(),
    SettingsScreen(),
  ].obs;

  final titles = [
    "Asroo Shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;

  void changeBottomNavItem(int index)
  {
    currentIndex = index as RxInt;
    update();
  }
}