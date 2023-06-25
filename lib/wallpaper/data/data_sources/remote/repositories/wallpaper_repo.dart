import 'package:my_eyesight/wallpaper/domain/entities/wallpaper_model.dart';

abstract class WallpaperRepository {
  Future<WallpaperModel?> getWallpaperData();
  Future<WallpaperModel?> loadMoreWallpaperData(String nextPage);
}
