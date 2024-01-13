import 'dart:convert';

import 'package:adventur_ads/global/components/show_toast_app.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/endpoints/url_api.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';
import 'package:adventur_ads/modules/top10/models/top_ten_points_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class Top10Controller extends GetxController {
  final Dio _dio = Dio();
  final String? _token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;

  TopTenPointsModel? topTenPointsModel;
  TopTenPointsModel? topTenInvitationsModel;

  @override
  void onInit() {
    _fetchTop10Data(topInvitationsUrl, (data) => topTenInvitationsModel = data);
    _fetchTop10Data(topPointsUrl, (data) => topTenPointsModel = data);
    super.onInit();
  }

  void _setLoading(bool status) {
    loading.value = status;
    update();
  }

  Future<void> _fetchTop10Data(
      String url, Function(TopTenPointsModel) onSuccess) async {
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
        onSuccess(TopTenPointsModel.fromJson(response.data));
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
