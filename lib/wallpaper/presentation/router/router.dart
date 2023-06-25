import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/presentation/di/home_page_biniding.dart';
import 'package:my_eyesight/wallpaper/presentation/di/search_binding.dart';
import 'package:my_eyesight/wallpaper/presentation/di/splash_binding.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/home_page/home_screen.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/search_page/search_screen.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/splash_screen/splash_screen.dart';
import 'package:my_eyesight/wallpaper/presentation/router/routes.dart';
import 'package:my_eyesight/wallpaper/shared/utils/utils.dart';

class AppRouter {
  static Transition? _transition() => isAndroid() ? null : Transition.fadeIn;

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: _transition(),
    ),
    GetPage(
      name: AppRoutes.searchScreen,
      page: () => SearchScreen(),
      binding: SearchPageBinding(),
      transition: _transition(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const MyHomePage(),
      binding: HomePageBinding(),
      transition: _transition(),
    ),
  ];
}
