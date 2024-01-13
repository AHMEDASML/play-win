import 'package:adventur_ads/global/common/functions_app.dart';
import 'package:adventur_ads/global/components/text_app_slime.dart';
import 'package:adventur_ads/global/data/local/cache_helper.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/layout/view/layout_screen.dart';
import 'package:adventur_ads/modules/login/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final   authController = Get.put(AuthController());
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 80,
        ),
        Center(
            child: Image.asset('assets/images/test1.jpg',
                width: 200, height: 200)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: textSlime(
              text: 'You can register in the application easily',
              color: ColorManager.muve,
              sizeFont: 14,
              fontWeight: FontWeight.w500),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: isSigningIn ? CircularProgressIndicator() :

          FlutterSocialButton(
            onTap: () async {
              setState(() {
                isSigningIn = true;
              });
              try {
                await authController.signInWithGoogle();
              } catch (error) {
                print('Failed to sign in with Google: $error');
              } finally {
                setState(() {
                  isSigningIn = false;
                });
              }
            },
            buttonType: ButtonType.google,
            iconColor: ColorManager.white,
          ),
        ),
      ]),
    );
  }
}
