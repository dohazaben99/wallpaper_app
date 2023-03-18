import 'package:flutter/material.dart';
import 'package:my_eyesight/view_ui/search_screen.dart';

import '../../view_ui/favorites_screen.dart';
import '../../view_ui/home_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "/search_screen": (_) =>  SearchScreen(),
  "/home_screen": (_) => const MyHomePage(),
  "/favorites_screen": (_) => const FavoritesScreen(),
};
