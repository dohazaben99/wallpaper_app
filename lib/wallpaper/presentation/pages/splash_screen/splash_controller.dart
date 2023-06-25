import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/presentation/router/routes.dart';

class SplashController extends GetxController {
  void getToTheNextPage() => Get.offAllNamed(AppRoutes.homeScreen);

  void startRoute() {
    print("sjsjj ");
    // Future.delayed(Duration(milliseconds: 1500));
    print("sjsjj ww222  ");

    // getToTheNextPage();
  }

  @override
  void onInit() {
    startRoute();
    super.onInit();
  }
}
