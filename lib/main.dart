import 'package:flutter/material.dart';
import 'package:my_eyesight/constans_config/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:my_eyesight/logic/providers/home_screen_controller.dart';
import 'package:my_eyesight/view_ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: appRoutes,
      ),
    );
  }
}
