import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/components/text_app_slime.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class ItemFirstInvitations extends StatelessWidget {
  final String number;
  final String? title;
  final String? name;
  final String? point;

  const ItemFirstInvitations({Key? key, required this.number, this.title, this.name, this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: ColorManager.black, width: 4)),
            child: CircleAvatar(
              radius: 28,
              child:
              textBold(text: title?? 'A', color: ColorManager.white, sizeFont: 28),
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: ColorManager.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: textBold(text: number, color: ColorManager.white, sizeFont: 16),
        ),

        SizedBox(height: 10,),
        textSlime(text: name ?? 'name', color: ColorManager.black, sizeFont: 14),
        textSlime(text:point ?? ' point', color: ColorManager.black.withOpacity(0.7), sizeFont: 12),

      ],
    );
  }
}