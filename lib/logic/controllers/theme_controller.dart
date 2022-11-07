import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController
{
 final String isDarkModesKey = "isDarkModes";
  final GetStorage boxStorage = GetStorage();

  saveThemDataInBox(bool isDark){
    boxStorage.write(isDarkModesKey, isDark);
  }

  bool getThemeDataFromBox(){
   return boxStorage.read<bool>(isDarkModesKey)??false;
  }

  ThemeMode get themeDataGet=>
      getThemeDataFromBox()?ThemeMode.dark:ThemeMode.light;

  void changeTheme(){
    Get.changeThemeMode(
        getThemeDataFromBox()?ThemeMode.light:ThemeMode.dark);
    saveThemDataInBox(!getThemeDataFromBox());
  }
}