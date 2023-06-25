import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/data/data_sources/remote/repositories/searched_wallpaper_repo.dart';
import 'package:my_eyesight/wallpaper/domain/repositories/searched_wallpaper_impl.dart';

import '../pages/search_page/search_controller.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchWallpaperRepository>(
        () => SearchedWallpaperRepositoryImplementation());

    Get.put(SearchPageController(Get.find<SearchWallpaperRepository>()));
  }
}
