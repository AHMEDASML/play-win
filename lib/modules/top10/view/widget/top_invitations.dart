import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/Invitations/view/widget/item_first_invitations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/top_ten_points_model.dart';

class TopInvitations extends StatefulWidget {
  final Data topInvitationsModel;
  const TopInvitations({Key? key, required this.topInvitationsModel}) : super(key: key);

  @override
  State<TopInvitations> createState() => _TopInvitationsState();
}

class _TopInvitationsState extends State<TopInvitations> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Add this
              shrinkWrap: true,
              itemCount: widget.topInvitationsModel.top7.length,
              itemBuilder: (context, index) {
                return itemTopInvitations(
                  topInviMode: widget.topInvitationsModel.top7[index],
                );
              }),
        ],
      ),
    );
  }
}

Widget itemTopInvitations({required Top7 topInviMode}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30.0,

          backgroundImage: NetworkImage(topInviMode.userPhotoUrl),

          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManager.black4.withOpacity(0.8),
                width: 4.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBold(text: topInviMode.userDisplayName, sizeFont: 16, color: ColorManager.muve),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.person_2_outlined),
                const SizedBox(
                  width: 2,
                ),
                textBold(
                    text: topInviMode.totalPoints.toString(),
                    sizeFont: 14,
                    fontWeight: FontWeight.w300,
                    color: ColorManager.muve),
              ],
            )
          ],
        )
      ],
    ),
  );
}
