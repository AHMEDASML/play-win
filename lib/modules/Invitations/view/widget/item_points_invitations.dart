import 'package:adventur_ads/global/components/text_app_slime.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class ItemPointsInvitations extends StatelessWidget {
  const ItemPointsInvitations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xffEEEEF0),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Row(children: [
                const Icon(Icons.person_outlined),
                const SizedBox(width: 2,),
                textSlime(text: 'Invitations : 15',
                    color: ColorManager.black.withOpacity(0.8), sizeFont: 16),
              ],),


              Row(children: [

                const Icon(Icons.payments_outlined),
                const SizedBox(width: 2,),
                textSlime(text: 'Call points : 1',
                    color: ColorManager.black.withOpacity(0.8), sizeFont: 16),

              ],),
            ]),
      ),
    );
  }
}