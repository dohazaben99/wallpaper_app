import 'package:flutter/material.dart';
import 'package:my_eyesight/provider_files/constants_config/routes/app_routes.dart';
import 'package:my_eyesight/provider_files/view/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/providers/home_screen_controller.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenController>(
            create: (_) => HomeScreenController()),
      ],
      child: MaterialApp(
        title: 'my eyesight',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen(),
        routes: appRoutes,
      ),
    );
  }
}
