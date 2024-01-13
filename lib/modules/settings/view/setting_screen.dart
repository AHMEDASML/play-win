import 'package:adventur_ads/global/components/appBar_app.dart';
import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adventur_ads/modules/settings/controller/setting_controller.dart';

import 'widget/item_profile_data.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(text: 'Settings'),
      body: GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) {
          return Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textBold(
                          text: 'Profile_personly', color: ColorManager.grey),
                      textBold(text: 'Edit_profile', color: ColorManager.grey),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const ItemProfileData(),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: textBold(text: 'Settings', color: ColorManager.grey),
                ),

                const SizedBox(height: 10),

                itemSetting(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: controller.selectedLanguage,
                  onTap: _showLanguageSelectionDialog,
                ),
                const SizedBox(
                  height: 20,
                ),
                itemSetting(
                  icon: Icons.delete_forever,
                  title: 'delete_account',
                  subtitle: 'Collected_account_data_will_be_erased',
                  onTap: () => _showDeleteAccountDialog(),
                ),

                // const ListTile(
                //   leading: Icon(Icons.money),
                //   title: Text('جنون حساب'),
                //   subtitle: Text('جمع بيانات الحساب ستيم حتونا'),
                //   trailing: Icon(Icons.arrow_forward_ios),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showLanguageSelectionDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('English'),
              onTap: () {
                _changeLanguage('en');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Arabic'), // Example of another language
              onTap: () {
                _changeLanguage('ar');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }


  void _changeLanguage(String codeLang) {
    final controller = Get.find<SettingController>();
    controller.changeLang(codeLang: codeLang);
    setState(() {});
  }


  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account? All your data will be permanently removed.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Add your delete logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    void _changeLanguage(String codeLang) {
      final controller = Get.find<SettingController>();
      controller.changeLang(codeLang: codeLang);
      setState(() {});
    }
  }
}


Widget itemSetting({
  required IconData icon,
  required String title,
  required String subtitle,
  VoidCallback? onTap, // Add this line
}) {
  return InkWell( // Wrap the container with InkWell to handle taps
    onTap: onTap, // Use the onTap parameter here
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.black4)),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorManager.gray3.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon, color: ColorManager.muve),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, color: ColorManager.muve),
      ),
    ),
  );
}

