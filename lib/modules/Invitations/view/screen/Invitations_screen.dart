import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/components/text_app_slime.dart';
import 'package:adventur_ads/global/components/title_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/Invitations/view/widget/item_first_invitations.dart';
import 'package:adventur_ads/modules/Invitations/view/widget/item_points_invitations.dart';
import 'package:adventur_ads/modules/Invitations/view/widget/item_share_button.dart';
import 'package:flutter/material.dart';

class InvitationsScreen extends StatefulWidget {
  const InvitationsScreen({Key? key}) : super(key: key);

  @override
  State<InvitationsScreen> createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends State<InvitationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new),
                    textSlime(
                        text: 'View all',
                        color: ColorManager.black,
                        sizeFont: 16),
                  ],
                ),
                textBold(
                    text: 'Active players',
                    color: ColorManager.muve,
                    sizeFont: 16),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemFirstInvitations(
                  number: '1',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: ItemFirstInvitations(
                    number: '2',
                  ),
                ),
                ItemFirstInvitations(
                  number: '3',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xffCBBFE3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: textSlime(
                  text:
                      'Invite your friends and get 10% of the points they collect for life',
                  color: ColorManager.muve.withOpacity(0.8),
                  sizeFont: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const ItemPointsInvitations(),
          const ItemShareButton()
        ]),
      ),
    );
  }
}
