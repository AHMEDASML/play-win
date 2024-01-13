import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/data/remote/dio_helper.dart';
import 'package:adventur_ads/global/localization/locale.dart';
import 'package:adventur_ads/global/themes/themes.dart';
import 'package:adventur_ads/global/utils/bindings_app.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:adventur_ads/modules/details_gift/view/details_gift_screen.dart';
import 'package:adventur_ads/modules/games/view/games_screen.dart';
import 'package:adventur_ads/modules/layout/view/layout_screen.dart';
import 'package:adventur_ads/modules/login/view/login_screen.dart';
import 'package:adventur_ads/modules/settings/view/setting_screen.dart';
import 'package:adventur_ads/modules/test_admob.dart';
import 'package:adventur_ads/modules/top10/view/screen/top10_screen.dart';
import 'package:adventur_ads/modules/winners_today/view/screen/winners_today_screen.dart';
import 'package:adventur_ads/modules/winners_today/view/widget/winners_today.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_options.dart';



String lang='en';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.delayed(const Duration(milliseconds: 50));
  SizeApp.screenSize =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  DioHelper.init();
  await CacheHelper.init();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // delete
    // changeLang(codeLang: 'en');
    CacheHelper.saveData(key: TOKEN,value: '1|wRA1YkxecbM6BgLgpuOfEMmr8prr8WDS5RFBOlLI1db9b4b2');
    print('aaaaaaaaaaaa');
    print(CacheHelper.getData(key: TOKEN));

    // lang= CacheHelper.getData(key: LANGUAGE) ?? 'en';
    return GetMaterialApp(
      locale: language(),
      translations: LocaleApp(),
      initialBinding: BindingsApp(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: Themes.customDarkTheme,
      theme: Themes.customLightTheme,
      // home: CacheHelper.getData(key: 'GoogleID') == null ? LoginScreen() : LayoutScreen(),
      home: CacheHelper.getData(key: TOKEN) == null ? LoginScreen() : LayoutScreen(),
      // home: CacheHelper.getData(key: TOKEN) == null ? LoginScreen() : DetailsGiftScreen(idDetailsGift: 1,),

      //
      // home: MoreSpecializationsScreen(),
    );
  }
}
