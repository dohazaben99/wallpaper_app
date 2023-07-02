import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/data/data_sources/remote/repositories/searched_wallpaper_repo.dart';
import 'package:my_eyesight/wallpaper/domain/entities/wallpaper_model.dart';
import 'package:my_eyesight/wallpaper/shared/enums/screen_state_enums.dart';

class SearchPageController extends GetxController {
  final SearchWallpaperRepository _searchWallpaperRepo;

  SearchPageController(this._searchWallpaperRepo);

  WallpaperModel? searchWallpapers = WallpaperModel();
  ScreenStateEnum _screenEnum = ScreenStateEnum.loaded;
  ScrollController scrollController = ScrollController();

  ScreenStateEnum get screenEnum => _screenEnum;

  set screenEnum(ScreenStateEnum v) {
    _screenEnum = v;
    update();
  }

  @override
  void onInit() async {
    listViewListener();
    super.onInit();
  }

  Future<void> getSearchedWallpapersData(String queryData) async {
    screenEnum = ScreenStateEnum.loading;

    searchWallpapers =
        await _searchWallpaperRepo.getSearchedWallpaperData(queryData);

    screenEnum = ScreenStateEnum.loaded;
  }

  Future<void> loadMoreData() async {
    WallpaperModel? moreWallpapers;

    moreWallpapers = await _searchWallpaperRepo
        .loadMoreSearchedWallpaperData(searchWallpapers!.nextPage!);

    searchWallpapers!.nextPage = moreWallpapers!.nextPage!;
    searchWallpapers!.photos!.addAll(moreWallpapers.photos!);

    update();
  }

  listViewListener() {
    scrollController = ScrollController();
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


  setIsFavorite(int index) {
    // if (isFromSearch) {
    //   searchedWallpapers.photos![index].liked =
    //   !searchedWallpapers.photos![index].liked!;
    // } else {
    searchWallpapers!.photos![index].liked = !searchWallpapers!.photos![index].liked!;
    print("is favoriete${searchWallpapers!.photos![index].liked}");
    // }
    update();
  }

  clearSearchList() {
    searchWallpapers = WallpaperModel();
    update();
  }
}
