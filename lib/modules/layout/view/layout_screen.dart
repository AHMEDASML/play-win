import 'package:adventur_ads/global/common/loading_app.dart';
import 'package:adventur_ads/global/components/appBar_app.dart';
import 'package:adventur_ads/global/components/drawer_app.dart';
import 'package:adventur_ads/modules/Invitations/view/screen/Invitations_screen.dart';
import 'package:adventur_ads/modules/app/controller/app_controller.dart';
import 'package:adventur_ads/modules/competitions/view/screen/competitions_screen.dart';
import 'package:adventur_ads/modules/gifts/view/gifts_screen.dart';
import 'package:adventur_ads/modules/home/view/home_screen.dart';
import 'package:adventur_ads/modules/points/view/points_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adventur_ads/global/utils/color_app.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 2;
  final AppController appController = Get.put(AppController());

  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const List<Widget> _widgetOptions = <Widget>[
    CompetitionsScreen(),
    InvitationsScreen(),
    HomeScreen(),
    GiftsScreen(),
    PointsScreen(),


    // GiftsScreen(),
    // PointsScreen(),
    // InvitationsScreen(),
    // CompetitionsScreen(),
    // HomeScreen(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(),
      drawer: drawerApp(context: context),
      backgroundColor: ColorManager.white,
      body: Obx(() {
        if (appController.loading.value) {
          return Center(child: loadingAppWidget());
        } else if (appController.errorMessage.value.isNotEmpty) {
          return Center(child: Text(appController.errorMessage.value));
        } else {
          return _widgetOptions.elementAt(_selectedIndex);
        }
      }),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const MyNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: ColorManager.gray,
      unselectedItemColor: ColorManager.seventhBlue,
      onTap: onItemTapped,
      items: [
        _buildNavigationBarItem(Icons.person_2_outlined, 'Invitations'.tr),
        _buildNavigationBarItem(Icons.camera, 'Contests'.tr),
        const BottomNavigationBarItem(
          tooltip: 'games',
          label: 'games',
          icon: Icon(
            Icons.games_outlined,
            size: 34,
            color: Colors.pink,
          ),
        ),
        _buildNavigationBarItem(Icons.card_giftcard_outlined, 'Gifts'.tr),

        _buildNavigationBarItem(Icons.control_point_duplicate_outlined, 'points'.tr),
      ],
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      tooltip: label,
      label: label,
      icon: Icon(
        icon,
        size: 30,
        color: ColorManager.pink.withOpacity(0.8),
      ),
    );
  }
}
