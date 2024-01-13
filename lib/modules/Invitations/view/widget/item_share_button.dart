import 'package:adventur_ads/global/components/text_app_slime.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/Invitations/controller/invitations_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemShareButton extends StatelessWidget {
  const ItemShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invitationsController = Get.put(InvitationsController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: GestureDetector(
        onTap: invitationsController.shareInvitationLink,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xff453C51),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: textSlime(
                    text: 'Click to share your assignment code',
                    color: ColorManager.white,
                    sizeFont: 16),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
