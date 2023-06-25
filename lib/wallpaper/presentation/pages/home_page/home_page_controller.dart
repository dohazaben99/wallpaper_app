import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/shared/enums/screen_state_enums.dart';
import 'package:my_eyesight/wallpaper/data/data_sources/remote/repositories/wallpaper_repo.dart';

import '../../../domain/entities/wallpaper_model.dart';

class HomePageController extends GetxController {
  final WallpaperRepository _wallpaperRepository;

  ScreenStateEnum _screenEnum = ScreenStateEnum.loaded;

  WallpaperModel? wallpapers;

  ScrollController scrollController = ScrollController();

  ScreenStateEnum get screenEnum => _screenEnum;

  set screenEnum(ScreenStateEnum v) {
    _screenEnum = v;
    update();
  }

  HomePageController(
    this._wallpaperRepository,
  );

  @override
  void onInit() async {
    // _wallpaperRepository.getWallpaperData();

    screenEnum = ScreenStateEnum.loading;
    await Future.wait([
      getWallpapersData(),
    ]);
    screenEnum = ScreenStateEnum.loaded;

    listViewListener();

    super.onInit();
  }

  Future<void> getWallpapersData() async {
    wallpapers = await _wallpaperRepository.getWallpaperData();
  }

  Future<void> loadMoreData() async {
    WallpaperModel? moreWallpapers;

    moreWallpapers =
        await _wallpaperRepository.loadMoreWallpaperData(wallpapers!.nextPage!);
    wallpapers!.nextPage = moreWallpapers!.nextPage!;
    wallpapers!.photos!.addAll(moreWallpapers.photos!);

    update();
  }

  // void goToDetails() async {
  //   final res = await Get.toNamed(
  //     AppRoutes.,
  //     // arguments: type,
  //   );
  //   if (res == ScreenEnums.refresh) {
  //     onInit();
  //   }
  // }

  listViewListener() {
    scrollController.addListener(() {
      bool loadVisible = !scrollController.hasClients
          ? false
          : scrollController.offset < scrollController.position.maxScrollExtent
              ? false
              : true;
      if (loadVisible) {
        scrollController.animateTo(
            scrollController.position.maxScrollExtent - 10,
            duration: const Duration(microseconds: 1),
            curve: Curves.linear);
        loadMoreData();
        // Provider.of<HomeScreenController>(context, listen: false)
        //     .loadMoreData();

      }
    });
  }
}
