import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:my_eyesight/wallpaper/shared/style/colors.dart';
import 'package:my_eyesight/wallpaper/presentation/router/routes.dart';
import 'package:my_eyesight/wallpaper/shared/enums/screen_state_enums.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/home_page/home_page_controller.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/wallpaper_details/wallpaper_details_screen.dart';

class MyHomePage extends GetView<HomePageController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100]!.withOpacity(0.9),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                // Provider.of<HomeScreenController>(context, listen: false)
                //     .clearSearchList();
                // Navigator.of(context).pushNamed("/search_screen");
                Get.toNamed(AppRoutes.searchScreen);
              },
              label: const Text('Search',
                  style: TextStyle(
                    color: AppColors.darkPrimary,
                  )),
              heroTag: "btn1",
              icon: const Icon(
                Icons.search,
                color: AppColors.darkPrimary,
              ),
              backgroundColor: AppColors.lightPurple,
            ),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
              onPressed: () {
                // Navigator.pushNamed(context, "/favorites_screen");
              },
              heroTag: "btn2",
              label: const Text('Favorites',
                  style: TextStyle(
                    color: AppColors.darkPrimary,
                  )),
              icon: const Icon(
                Icons.favorite_rounded,
                color: AppColors.darkPrimary,
              ),
              backgroundColor: AppColors.lightPurple,
            ),
          ],
        ),
        body: SafeArea(
          child: GetBuilder<HomePageController>(
            builder: (_) {
              print("hahahah ${controller.screenEnum}");
              print(
                  "hahahah ${controller.screenEnum == ScreenStateEnum.loading}");
              if (controller.screenEnum == ScreenStateEnum.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                  controller: controller.scrollController,
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 8),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: controller.wallpapers!.photos!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 350),
                        child: FadeInAnimation(
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                WallpaperDetailsScreen(
                                  imageUrl: controller.wallpapers!
                                      .photos![index].src!.portrait!,
                                  index: index,
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: GridTile(
                                footer: GridTileBar(
                                  backgroundColor: Colors.black26,
                                  title: Text(
                                      "${controller.wallpapers!.photos![index].photographer}"),
                                  leading: const Icon(Icons.monochrome_photos),
                                ),
                                child: CachedNetworkImage(
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                          child: CircularProgressIndicator(
                                              value: progress.progress)),
                                  fit: BoxFit.cover,
                                  imageUrl: controller
                                      .wallpapers!.photos![index].src!.tiny!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ));
  }
}
