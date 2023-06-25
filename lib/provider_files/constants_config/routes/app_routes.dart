import 'package:flutter/material.dart';
import 'package:my_eyesight/provider_files/view/favorites_screen.dart';
import 'package:my_eyesight/provider_files/view/home_screen.dart';
import 'package:my_eyesight/provider_files/view/search_screen.dart';



final Map<String, Widget Function(BuildContext)> appRoutes = {
  "/search_screen": (_) =>  const SearchScreen(),
  "/home_screen": (_) => const MyHomePage(),
  "/favorites_screen": (_) => const FavoritesScreen(),
};
