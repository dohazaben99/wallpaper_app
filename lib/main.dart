import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/presentation/router/router.dart';
import 'package:my_eyesight/wallpaper/presentation/router/routes.dart';
import 'package:my_eyesight/wallpaper/shared/core/localization/translations.dart';
import 'package:my_eyesight/wallpaper/shared/style/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'my eyesight',
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.routes,
      initialRoute: AppRoutes.splashScreen,
      translations: AppTranslation(),
      locale: const Locale("en"),
      theme: AppThemes.getTheme(),
    );
  }
}
