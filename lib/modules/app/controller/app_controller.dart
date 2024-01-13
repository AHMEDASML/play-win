import 'dart:io';

import 'package:get/get.dart';
import 'dart:convert';

import 'package:adventur_ads/global/components/show_toast_app.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/endpoints/url_api.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';

import 'package:dio/dio.dart';


class AppController extends GetxController {


  final String? token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;


  int point=0;

  @override
  void onInit() {
    myPointsFun();
    super.onInit();
  }


  void _setLoading(bool status) {
    loading.value = status;
    update();
  }


  Future<void> myPointsFun() async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      _setLoading(true);
      var dio = Dio();
      var response = await dio.request(
        myPointsUrl,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print('ASDASDASDASDWQWQEQW');
        point = int.parse(response.data);
      } else {
        errorMessage.value = 'Error: Try again later.';
      }
    } catch (e) {
      if (e is DioError && e.error is SocketException) {
        errorMessage.value = 'No Internet connection.';
      } else {
        errorMessage.value = 'Error: Try again later.';
      }
    } finally {
      _setLoading(false);
    }
  }
}
