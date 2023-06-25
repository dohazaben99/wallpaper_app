import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/data/data_sources/remote/repositories/wallpaper_repo.dart';
import 'package:my_eyesight/wallpaper/domain/repositories/wallpaper_repo_imp.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/home_page/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WallpaperRepository>(() => WallpaperRepositoryImplementation());
    Get.put(HomePageController(
        Get.find<WallpaperRepository>()
    ));
  }
}