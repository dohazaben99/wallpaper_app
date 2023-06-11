import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_eyesight/controller/providers/home_screen_controller.dart';
import 'package:my_eyesight/models/wallpaper_model.dart';
import 'package:my_eyesight/view/wallpaper_details_screen.dart';
import 'package:provider/provider.dart';

import '../constants_config/app_assets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("My favorite!"),
        // titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppAssetsProvider.backgroundImage,
                ),
                fit: BoxFit.fill)),
        child: FutureBuilder<List<Photo>>(
          future: Provider.of<HomeScreenController>(context, listen: false)
              .getFavoritesList(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Save your interests here! ... ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.add_a_photo_outlined)
                      ],
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 8),
                      padding: const EdgeInsets.only(
                          bottom: 17, top: 85, right: 10, left: 10),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 1000),
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => WallpaperDetailsScreen(
                                            imageUrl: snapshot
                                                .data![index].src!.portrait!,
                                            index: index,
                                          )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: GridTile(
                                    footer: GridTileBar(
                                      backgroundColor: Colors.black26,
                                      title: Text(
                                          "${snapshot.data![index].photographer}"),
                                      leading:
                                          const Icon(Icons.monochrome_photos),
                                    ),
                                    child: CachedNetworkImage(
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                        child: CircularProgressIndicator(
                                            value: progress.progress),
                                      ),
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          snapshot.data![index].src!.tiny!,
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
                        //               imageUrl:
                        //                   snapshot.data![index].src!.portrait,
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
                        //         imageUrl: snapshot.data![index].src!.tiny!,
                        //       ),
                        //     ),
                        //   ),
                        // );
                      });
            }
            if (snapshot.hasError) {
              print("the error is ${snapshot.error}");
              return const Center(
                child: Text("something went wrong"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
