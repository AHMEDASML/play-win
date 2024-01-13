import 'dart:convert';

import 'package:adventur_ads/global/components/show_toast_app.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/endpoints/url_api.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';
import 'package:adventur_ads/modules/gifts/models/gifts_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GiftsController extends GetxController {
  final Dio _dio = Dio();
  final String? _token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;

  GiftsModel? giftsModelGames;
  GiftsModel? giftsModelCashe;

  @override
  void onInit() {
    _fetchGiftData(giftCashUrl, (data) => giftsModelCashe = data);
    _fetchGiftData(giftGamesUrl, (data) => giftsModelGames = data);
    super.onInit();
  }

  void _setLoading(bool status)  {
    loading.value = status;
    update();
  }

  Future<void> _fetchGiftData(String url, Function(GiftsModel) onSuccess) async {
    if (_token == null) {
      showToastApp(text: 'Token not found', color: ColorManager.firstRed);
      return;
    }

    try {
      _setLoading(true);
      var headers = {'Authorization': 'Bearer $_token'};
      var response = await _dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(json.encode(response.data)); // Consider removing for production
        onSuccess(GiftsModel.fromJson(response.data));
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
}
