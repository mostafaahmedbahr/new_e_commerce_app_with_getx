import 'package:get/route_manager.dart';

import 'package:new_e_commerce_app/lang/fr.dart';

import '../utils/my_strings.dart';
import 'ar.dart';
import 'en.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    frf: fr,
  };
}
