import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/games/view/games_screen.dart';
import 'package:adventur_ads/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (con) {
          return Center(
            child: Column(
              children: [
                const Text('List of games',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    navigateTo(context,WebViewScreen());
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ColorManager.black)),
                    child: const Center(
                        child: Text('Games 1',
                            style: TextStyle(color: Colors.black, fontSize: 30))),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
