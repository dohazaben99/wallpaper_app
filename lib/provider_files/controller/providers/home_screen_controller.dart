import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../models/wallpaper_model.dart';

class HomeScreenController extends ChangeNotifier {
  WallpaperModel wallpapers = WallpaperModel();
  WallpaperModel searchedWallpapers = WallpaperModel();

  fetchData() async {
    http.Response response = await http.get(
      Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {
        "Authorization":
            "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
      },
    );
    log("get home page wallpaper =>  ${response.body} ");
    log("get home page wallpaper =>  ${response.request} ");

    if (response.statusCode == 200) {
      wallpapers = wallpaperModelFromJson(response.body);
    } else {}
    notifyListeners();
  }

  loadMoreData() async {
    // List<Photo> temp = [];
    http.Response response = await http.get(
      Uri.parse(wallpapers.nextPage!),
      headers: {
        "Authorization":
            "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
      },
    );
    log("get home page wallpaper =>  ${response.body} ");
    log("get home page wallpaper =>  ${response.request} ");

    wallpapers.nextPage = wallpaperModelFromJson(response.body).nextPage!;
    wallpapers.photos!.addAll(wallpaperModelFromJson(response.body).photos!);

    notifyListeners();
  }

  fetchSearchedData(String queryData) async {
    http.Response response = await http.get(
      Uri.parse("https://api.pexels.com/v1/search?query=$queryData"),
      headers: {
        "Authorization":
            "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
      },
    );
    log("get searched data  ${response.body} \n");
    log("get searched data  ${response.statusCode} \n");
    if (response.statusCode == 200) {
      searchedWallpapers = wallpaperModelFromJson(response.body);
    } else {
      searchedWallpapers = WallpaperModel();
    }
    notifyListeners();
  }

  loadMoreSearchedData() async {
    http.Response response = await http.get(
      Uri.parse(searchedWallpapers.nextPage!),
      headers: {
        "Authorization":
            "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
      },
    );
    log("get searched data  ${response.body} \n");
    log("get searched data  ${response.statusCode} \n");
    if (response.statusCode == 200) {
      searchedWallpapers.nextPage =
          wallpaperModelFromJson(response.body).nextPage!;
      searchedWallpapers.photos!
          .addAll(wallpaperModelFromJson(response.body).photos!);
    } else {}
    notifyListeners();
  }

  Future<void> download(url) async {
    final response = await http.get(Uri.parse(url));
    final imageName = path.basename(url);
    final appDir = await getExternalStorageDirectory();

    print(response.body);
    final localPath = path.join(appDir!.path, imageName);

    print("the downloaded path ${appDir.path}");
    final imageFile = File(localPath);
    await imageFile
        .writeAsBytes(response.bodyBytes)
        .then((value) => print("after save ${value.path}"));

    print("the downloaded path ${imageFile.path}");
  }

  setIsFavorite(int index, bool isFromSearch) {
    if (isFromSearch) {
      searchedWallpapers.photos![index].liked =
          !searchedWallpapers.photos![index].liked!;
    } else {
      wallpapers.photos![index].liked = !wallpapers.photos![index].liked!;
      print("is favoriete${wallpapers.photos![index].liked}");
    }
    notifyListeners();
  }

  Future<List<Photo>> getFavoritesList() async {
    List<Photo> favoritesList = [];

    if (wallpapers.photos != null) {
      for (var element in wallpapers.photos!) {
        if (element.liked!) {
          favoritesList.add(element);
        }
      }
    }

    if (searchedWallpapers.photos != null) {
      for (var element in searchedWallpapers.photos!) {
        if (element.liked!) {
          favoritesList.add(element);
        }
      }
    }

    print("favorites list lenghth${favoritesList.length}");
    return favoritesList;
  }

  clearSearchList() {
    searchedWallpapers = WallpaperModel();
    notifyListeners();
  }
}
