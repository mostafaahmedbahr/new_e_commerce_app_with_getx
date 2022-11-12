import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_e_commerce_app/lang/localization.dart';
import 'package:new_e_commerce_app/logic/controllers/theme_controller.dart';
import 'package:new_e_commerce_app/routes/routes.dart';
import 'package:new_e_commerce_app/utils/my_strings.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/screens/payment_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale:  Locale(GetStorage().read<String>("lang").toString()),
      fallbackLocale:   Locale(ene),
      translations: LocaliztionApp(),
      theme:ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      debugShowCheckedModeBanner: false,
      initialRoute:FirebaseAuth.instance.currentUser!=null ||
      GetStorage().read<bool>("auth")==true?AppRoutes.mainScreen:AppRoutes.welcome,
      getPages:AppRoutes.routes,

    );
  }
}

