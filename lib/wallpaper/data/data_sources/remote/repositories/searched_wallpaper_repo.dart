import 'package:my_eyesight/wallpaper/domain/entities/wallpaper_model.dart';

abstract class SearchWallpaperRepository {
  Future<WallpaperModel?> getSearchedWallpaperData(String queryData);
  Future<WallpaperModel?> loadMoreSearchedWallpaperData(String nextPage);
}
