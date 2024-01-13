import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  String selectedLanguage = 'en'; // Default language

  @override
  void onInit() {
    super.onInit();
    selectedLanguage = CacheHelper.getData(key: LANGUAGE) ?? 'en';
  }

  void changeLang({required String codeLang}) {
    selectedLanguage = codeLang; // Update the language
    Locale locale = Locale(codeLang);
    CacheHelper.saveData(key: LANGUAGE, value: codeLang); // Save only language code
    Get.updateLocale(locale);
    update(); // Notify listeners
  }
}


