import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/search_page/search_controller.dart';
import 'package:my_eyesight/wallpaper/presentation/pages/wallpaper_details/wallpaper_details_screen.dart';
import 'package:my_eyesight/wallpaper/shared/enums/screen_state_enums.dart';
import 'package:my_eyesight/wallpaper/shared/style/colors.dart';

class SearchScreen extends GetView<SearchPageController> {
  final _formKey = GlobalKey<FormState>();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search your choices"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
        backgroundColor: AppColors.lightBlue.withOpacity(0.8),
        elevation: 2.5,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<SearchPageController>(builder: (logic) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "your intrest ...",
                    suffixIcon: IconButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          FocusScope.of(context).unfocus();
                        },
                        icon: const Icon(Icons.search)),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  onSaved: (value) {
                    controller.getSearchedWallpapersData(value!);
                  },
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    controller.getSearchedWallpapersData(value);
                  },
                ),
              ),
            ),
            Expanded(
              child: controller.searchWallpapers!.photos == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      alignment: Alignment.topLeft,
                      child: const Text("Search our gallery now!"),
                    )
                  : controller.screenEnum == ScreenStateEnum.loaded
                      ? GridView.builder(
                          controller: controller.scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 8),
                          padding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 20),
                          itemCount:
                              controller.searchWallpapers!.photos!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return AnimationConfiguration.staggeredGrid(
                              columnCount: 2,
                              position: index,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 350),
                                child: FadeInAnimation(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  WallpaperDetailsScreen(
                                                    imageUrl: controller
                                                        .searchWallpapers!
                                                        .photos![index]
                                                        .src!
                                                        .portrait!,
                                                    index: index,

                                                  )));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: GridTile(
                                        footer: GridTileBar(
                                          backgroundColor: Colors.black26,
                                          title: Text(
                                              "${controller.searchWallpapers!.photos![index].photographer}"),
                                          leading: const Icon(
                                              Icons.monochrome_photos),
                                        ),
                                        child: CachedNetworkImage(
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  Center(
                                            child: CircularProgressIndicator(
                                                value: progress.progress),
                                          ),
                                          fit: BoxFit.cover,
                                          imageUrl: controller.searchWallpapers!
                                              .photos![index].src!.tiny!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                            //   InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (ctx) => WallpaperDetailsScreen(
                            //               imageUrl: wallpaper.searchedWallpapers
                            //                   .photos![index].src!.portrait,
                            //               index: index,
                            //               isFromSearch: true,
                            //             )));
                            //   },
                            //   child: Card(
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(15)),
                            //     elevation: 3,
                            //     child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(15),
                            //       child: CachedNetworkImage(
                            //         progressIndicatorBuilder:
                            //             (context, url, progress) => Center(
                            //           child: CircularProgressIndicator(
                            //             value: progress.progress,
                            //           ),
                            //         ),
                            //         fit: BoxFit.cover,
                            //         imageUrl: wallpaper.searchedWallpapers
                            //             .photos![index].src!.tiny!,
                            //       ),
                            //     ),
                            //   ),
                            // );
                          })
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            )
          ],
        );
      }),
    );
  }
}
