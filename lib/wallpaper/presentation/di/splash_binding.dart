import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/splash_screen/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(SplashController());


  }
}