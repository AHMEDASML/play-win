import 'package:adventur_ads/global/utils/color_app.dart';

import 'package:flutter/material.dart';

class textBold extends StatelessWidget {
  final String text;
  final double? sizeFont;
  final  FontWeight? fontWeight;
  final Color? color;
  const textBold({Key? key, required this.text, this.sizeFont, this.fontWeight, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(
            fontWeight: fontWeight ?? FontWeight.w600,
            color: color ?? ColorManager.firstBlack, fontSize: sizeFont ?? 14));;
  }
}


