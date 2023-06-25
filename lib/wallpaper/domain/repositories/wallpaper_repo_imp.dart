import 'dart:developer';

import 'package:my_eyesight/wallpaper/data/data_sources/remote/repositories/wallpaper_repo.dart';
import 'package:my_eyesight/wallpaper/domain/entities/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class WallpaperRepositoryImplementation extends WallpaperRepository {
  @override
  Future<WallpaperModel?> getWallpaperData() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated"),
        headers: {
          "Authorization":
              "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
        },
      );
      log("get home page wallpaper =>  ${response.statusCode} ");
      log("get home page wallpaper =>  ${response.request} ");

      if (response.statusCode == 200) {
        return wallpaperModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("error in get wallpapers");
      return null;
    }
  }

  @override
  Future<WallpaperModel?> loadMoreWallpaperData(String nextPage) async {
      // List<Photo> temp = [];
     try{ http.Response response = await http.get(
        Uri.parse(nextPage),
        headers: {
          "Authorization":
          "VkV5eKrJ4G4463yWZ4ee5qiBS3AVGYEBVkWlqhVSqCrogqS11whoXSEB",
        },
      );
      log("get home page wallpaper =>  ${response.body} ");
      log("get home page wallpaper =>  ${response.request} ");

      // wallpapers.nextPage = wallpaperModelFromJson(response.body).nextPage!;
      // wallpapers.photos!.addAll(wallpaperModelFromJson(response.body).photos!);

       return wallpaperModelFromJson(response.body);
     } catch (e) {
       print("error in get wallpapers");
       return null;
     }
  }
}
