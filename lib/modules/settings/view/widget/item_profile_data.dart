import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:flutter/material.dart';

class ItemProfileData extends StatelessWidget {
  const ItemProfileData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(

        width: SizeApp.screenSize.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorManager.black4)
        ),
        child: Column(children: [

          SizedBox(height: 20,),

          CircleAvatar(
            radius: 34,
            backgroundColor: Colors.black,
            child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: textBold(text: 'A',color: ColorManager.white,sizeFont: 26,)
            ),
          ),




          SizedBox(height: 10), // Provide spacing between widgets

          textBold(text: 'Ahmed Al-Saleh',color: ColorManager.black4,sizeFont: 20,),

          textBold(text: 'asmlahmd15@gmail.com',color: ColorManager.black4,sizeFont: 12,fontWeight: FontWeight.w400),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min, // لتجنب شغل الصف للعرض الكامل إذا لم يكن ضروريًا.
            children: [
              textBold(
                text: 'point 1500',
                color: ColorManager.black4,
                sizeFont: 12,
              ),
              SizedBox(width: 4), // مسافة بين النص والأيقونة.
              Icon(
                Icons.monetization_on_outlined, // استبدل 'some_icon' بالأيقونة التي تريد استخدامها.
                color: ColorManager.black4,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              textBold(
                text: 'Invitations 5',
                color: ColorManager.black4,
                sizeFont: 12,
              ),
              SizedBox(width: 4),
              Icon(
                Icons.person_2_outlined,
                color: ColorManager.black4,
              ),
            ],
          ),

          SizedBox(height: 20,),


        ],),
      ),
    );
  }
}
