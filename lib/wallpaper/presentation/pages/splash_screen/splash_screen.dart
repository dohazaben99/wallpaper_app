import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:my_eyesight/wallpaper/presentation/pages/splash_screen/splash_controller.dart';
import 'package:my_eyesight/wallpaper/presentation/router/routes.dart';
import 'package:my_eyesight/wallpaper/shared/style/app_assets.dart';
import 'package:my_eyesight/wallpaper/shared/style/colors.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.pink,
                AppColors.lightPurple,
                AppColors.darkPurple,
                AppColors.blue,
                AppColors.lightBlue,
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Image.asset(
                AppAssets.cameraDesignIcon,
                color: AppColors.darkPrimary,
              ),
              Positioned(
                bottom: 250,
                right: 50,
                left: 50,
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  onFinished: () {
                    print("i finished");
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, "/home_screen", (route) => false);
                    Get.offAllNamed(AppRoutes.homeScreen);
                  },
                  animatedTexts: [
                    TyperAnimatedText(
                      "Welcome",
                      speed: const Duration(milliseconds: 65),
                      textStyle: const TextStyle(
                          fontSize: 22, color: AppColors.darkPrimary),
                    ),
                    TyperAnimatedText(
                      'Find all Your inspirations here (❁´◡`❁)',
                      speed: const Duration(milliseconds: 50),
                      textStyle: const TextStyle(
                          fontSize: 22, color: AppColors.darkPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
