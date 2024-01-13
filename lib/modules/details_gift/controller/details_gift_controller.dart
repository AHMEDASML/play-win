import 'dart:convert';
import 'dart:math';

import 'package:adventur_ads/global/components/show_toast_app.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/endpoints/url_api.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';
import 'package:adventur_ads/modules/details_gift/models/details_gift_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailsGiftController extends GetxController {
  final Dio _dio = Dio();
  final String? _token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;
  RxBool isRequestingGift = false.obs;
  DetailsGiftModel? detailsGiftModel;

  Future<void> fetchDetailsData(
      String url, Function(DetailsGiftModel) onSuccess) async {
    if (_token == null) {
      showToastApp(text: 'Token not found', color: ColorManager.firstRed);
      return;
    }

    try {
      _setLoading(true);
      var headers = {'Authorization': 'Bearer $_token'};
      var response = await _dio.post(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(json.encode(response.data)); // Consider removing for production
        onSuccess(DetailsGiftModel.fromJson(response.data));
        _setLoading(false);
      } else {
        print('Error: ${response.statusMessage}'); // Consider using a logger
      }
    } catch (e) {
      showToastApp(text: 'Error: $e', color: ColorManager.firstRed);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool status) {
    loading.value = status;
    update();
  }


  Future<void>requestGift({required int id})async{
    try{
      isRequestingGift.value = true;
      var headers = {
        'Authorization': 'Bearer $_token'
      };
      var dio = Dio();
      var response = await dio.post(
        '$requestGiftUrl/$id',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        showToastApp(text: 'تم تسجيل طلبك بنجاح', color: ColorManager.green);
      }
      else {
        showToastApp(text: 'Error: $e', color: ColorManager.firstRed);
      }
    }
    finally {
    isRequestingGift.value = false; // Set to false when request ends
    }
  }

  @override
  void onInit() {
    // fetchDetailsData('${detailsGiftUrl}1', (data) => detailsGiftModel = data);
    super.onInit();
  }
}




