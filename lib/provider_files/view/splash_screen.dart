
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_eyesight/constants_config/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, "/home_screen", (route) => false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                AppAssetsProvider.wallpaperSplash,
              ),
            ),
            Positioned(
              bottom: 250,
              right: 50,
              left: 50,
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                onFinished: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home_screen", (route) => false);
                },
                animatedTexts: [
                  TyperAnimatedText(
                    "Welcome",
                    speed: const Duration(milliseconds: 120),
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                  TyperAnimatedText(
                    'Find all Your inspirations here ...',
                    speed: const Duration(milliseconds: 120),
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                  // TyperAnimatedText(
                  //   '....',
                  //   speed: const Duration(milliseconds: 300),
                  //   textStyle: const TextStyle(fontSize: 24),
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}
