import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/Invitations/view/widget/item_first_invitations.dart';
import 'package:adventur_ads/modules/top10/models/top_ten_points_model.dart';
import 'package:flutter/material.dart';

class TopPoints extends StatefulWidget {
  final Data topTenPointsModel;

  const TopPoints({Key? key, required this.topTenPointsModel})
      : super(key: key);

  @override
  State<TopPoints> createState() => _TopPointsState();
}

class _TopPointsState extends State<TopPoints> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemFirstInvitations(
                name: widget.topTenPointsModel.top3[0].userDisplayName,
                point: widget.topTenPointsModel.top3[0].totalPoints,
                number: '1',
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: ItemFirstInvitations(
                  name: widget.topTenPointsModel.top3[1].userDisplayName,
                  point: widget.topTenPointsModel.top3[1].totalPoints,
                  number: '2',
                ),
              ),
              ItemFirstInvitations(
                name: widget.topTenPointsModel.top3[2].userDisplayName,
                point: widget.topTenPointsModel.top3[2].totalPoints,
                number: '3',
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: widget.topTenPointsModel.top7.length,
                itemBuilder: (context, index) {
                  return itemTopPoints(
                    topTenPointsMode: widget.topTenPointsModel.top7[index],
                  );
                })),
      ],
    );
  }
}

Widget itemTopPoints({required Top7 topTenPointsMode}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(topTenPointsMode.userPhotoUrl),
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
            textBold(
                text: topTenPointsMode.userDisplayName,
                sizeFont: 16,
                color: ColorManager.muve),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.monetization_on_outlined),
                const SizedBox(
                  width: 2,
                ),
                textBold(
                    text: 'point ${topTenPointsMode.totalPoints} ',
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
