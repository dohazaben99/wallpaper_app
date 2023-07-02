import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/home_page/home_page_controller.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/search_page/search_controller.dart';
import 'package:my_eyesight/wallpaper/shared/style/colors.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final bool isFromSearch;
  final int index;

  const WallpaperDetailsScreen(
      {Key? key,
      required this.imageUrl,
      required this.index,
      this.isFromSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          isFromSearch ==false?
          GetBuilder<HomePageController>(builder: (homeController) {
            return

          IconButton(
              onPressed: () {
                // Provider.of<HomeScreenController>(context, listen: false)
                //     .setIsFavorite(index, isFromSearch);


                homeController.setIsFavorite(index);
              },
              icon: Icon(
                homeController.wallpapers!.photos![index].liked!
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 30,
              )

              );
          }):
          GetBuilder<SearchPageController>(builder: (searchController) {
            return

              IconButton(
                  onPressed: () {
                    // Provider.of<HomeScreenController>(context, listen: false)
                    //     .setIsFavorite(index, isFromSearch);
                    searchController.setIsFavorite(index);
                  },
                  icon: Icon(
                    searchController.searchWallpapers!.photos![index].liked!
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    size: 30,
                  )

              );
          }),
          const SizedBox(width: 20)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          // Provider.of<HomeScreenController>(context, listen: false)
          //     .download(imageUrl);
        },
        label: const Text(
          'download',
          style: TextStyle(
            color: AppColors.darkPrimary,
          ),
        ),
        icon: const Icon(
          Icons.download_for_offline_rounded,
          size: 30,
          color: AppColors.darkPrimary,
        ),
        backgroundColor: AppColors.blue,
      ),
      body: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: CircularProgressIndicator(
            value: progress.progress,
            color: Colors.teal,
          ),
        ),
        fit: BoxFit.cover,
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        imageUrl: imageUrl,
      ),
    );
  }
}
