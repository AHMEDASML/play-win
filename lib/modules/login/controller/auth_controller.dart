import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/components/show_toast_app.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/endpoints/url_api.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/key_shared.dart';
import 'package:adventur_ads/modules/layout/view/layout_screen.dart';
import 'package:adventur_ads/modules/login/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserModel? createUsersModel;

  Future<void> registration(
      {required String userDisplayName,
      required String userPhoneNumber,
      required String userEmail,
      required String userPhotoURL}) async {
    try {
      final data = json.encode({
        'userPhoneNumber': userPhoneNumber,
        'userEmail': userEmail,
        'userDisplayName': userDisplayName,
        'userPhotoURL': userPhotoURL
      });

      var dio = Dio();
      var response = await dio.request(
        loginUrl,
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));

        createUsersModel = UserModel.fromJson(response.data);

        CacheHelper.saveData(
            key: 'token', value: createUsersModel!.accessToken);
        await CacheHelper.saveData(
            key: "userDisplayName", value: createUsersModel!.user.name);
        await CacheHelper.saveData(
            key: 'userEmail', value: createUsersModel!.user.email);
        await CacheHelper.saveData(
            key: 'email', value: createUsersModel!.user.email);
        await CacheHelper.saveData(
            key: 'phone', value: createUsersModel!.user.phone);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
      showToastApp(text: 'Try again', color: ColorManager.firstRed);
    }
  }

  void setLoading(bool status) {
    loading = status;
    update();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return Future.error('Sign in aborted by user');
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("GoogleToken: ${googleAuth.accessToken}");
    print("GoogleID: ${googleUser.id}");

    print("googleAuth.idToken: ${googleAuth.idToken}");

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    CacheHelper.saveData(
        key: 'GoogleToken', value: '${googleAuth.accessToken}');
    CacheHelper.saveData(key: 'GoogleID', value: googleUser.id);
    CacheHelper.saveData(key: 'idToken', value: '${googleAuth.idToken}');
    CacheHelper.saveData(key: 'userUid', value: '${userCredential.user?.uid}');
    CacheHelper.saveData(
        key: 'userPhoneNumber', value: '${userCredential.user?.phoneNumber}');
    CacheHelper.saveData(
        key: 'userEmail', value: '${userCredential.user?.email}');
    CacheHelper.saveData(
        key: 'userDisplayName', value: '${userCredential.user?.displayName}');
    CacheHelper.saveData(
        key: 'userPhotoURL', value: '${userCredential.user?.photoURL}');

    registration(
        userDisplayName: '${userCredential.user?.displayName}',
        userEmail: '${userCredential.user?.email}',
        userPhoneNumber: '${userCredential.user?.phoneNumber}',
        userPhotoURL: '${userCredential.user?.photoURL}');

    // طباعة معرف المستخدم من Firebase
    print("userUid: ${userCredential.user?.uid}");
    return userCredential;
  }
}
