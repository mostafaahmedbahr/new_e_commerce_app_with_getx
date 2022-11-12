import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_e_commerce_app/lang/fr.dart';

import '../../utils/my_strings.dart';

class SettingsController extends GetxController
{

   @override
  void onInit()async {
    super.onInit();
    localeLang = await getLang;
  }
   var switchValue = false.obs;
   var storage =GetStorage();
   var localeLang= ene;

   String capetalize(String profileName)
   {
      return profileName.split(" ").map((e) => e.capitalize).join(" ");
   }


   saveLang(lang)async{
      await storage.write("lang", lang);
   }
   changeLang(lang){
       saveLang(lang);
       if(localeLang == lang)
       {
          return;
       }
       else if(lang == frf)
       {
          localeLang == frf;
          saveLang(frf);
       }
       else if(lang == ara)
       {
          localeLang == ara;
          saveLang(ara);
       }
       else
       {
          localeLang == ene;
          saveLang(ene);
       }
      update();
   }
  Future<String> get getLang async{
      return await storage.read("lang");
  }

}