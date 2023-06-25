import 'dart:developer';

import 'package:my_eyesight/wallpaper/data/data_sources/remote/repositories/searched_wallpaper_repo.dart';
import 'package:my_eyesight/wallpaper/domain/entities/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class SearchedWallpaperRepositoryImplementation extends SearchWallpaperRepository {
  @override
  Future<WallpaperModel?> getSearchedWallpaperData(String queryData) async {
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
      return wallpaperModelFromJson(response.body);
    } else {
      return WallpaperModel();
    }
    // return null;
    // notifyListeners();
  }

  @override
  Future<WallpaperModel?> loadMoreSearchedWallpaperData(String nextPage)async {
    http.Response response = await http.get(
      Uri.parse(nextPage),
      headers: {
        "Authorization":
        "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
      },
    );
    log("get searched data  ${response.body} \n");
    log("get searched data  ${response.statusCode} \n");
    if (response.statusCode == 200) {


      return wallpaperModelFromJson(response.body);
    } else {
      return null;
    }
    // notifyListeners();
  }
  
}
