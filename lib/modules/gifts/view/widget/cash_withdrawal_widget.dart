import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/utils/size_app.dart';
import 'package:adventur_ads/modules/details_gift/view/details_gift_screen.dart';
import 'package:adventur_ads/modules/gifts/models/gifts_model.dart';
import 'package:flutter/material.dart';

class CashWithdrawalWidget extends StatefulWidget {
  final GiftsModel giftsModel;

  const CashWithdrawalWidget({Key? key, required this.giftsModel})
      : super(key: key);

  @override
  State<CashWithdrawalWidget> createState() => _CashWithdrawalWidgetState();
}

class _CashWithdrawalWidgetState extends State<CashWithdrawalWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.giftsModel.data.length,
            itemBuilder: (context, index) {
              return CashWithdrawaItem(
                  giftsModel: widget.giftsModel.data[index]);
            }));
  }
}


class CashWithdrawaItem extends StatelessWidget {
 final Datum giftsModel;

  const CashWithdrawaItem({Key? key, required this.giftsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: (){
          navigateTo(context,DetailsGiftScreen(idDetailsGift: giftsModel.id,));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
              width: SizeApp.screenSize.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade100),
              height: 170,
              child: Image.network(giftsModel.imageMain,fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}

