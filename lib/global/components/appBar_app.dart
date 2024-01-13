import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:flutter/material.dart';

AppBar appBarApp({String? text}) {
  return AppBar(
    iconTheme: IconThemeData(color: ColorManager.gray),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: Text(text ?? 'Logo', style: const TextStyle(color: Colors.black)),
    actions: [],
  );
}
