 import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:flutter/material.dart';

Widget loadingAppWidget(){
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Center(child: CircularProgressIndicator(

      color: ColorManager.muve,
    )),
  );
}