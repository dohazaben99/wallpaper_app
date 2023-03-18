import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/providers/home_screen_controller.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  final imageUrl;
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
          IconButton(
            onPressed: () {
              Provider.of<HomeScreenController>(context, listen: false)
                  .setIsFavorite(index, isFromSearch);
            },
            icon: Selector<HomeScreenController, bool>(
                selector: (_, prov) => isFromSearch
                    ? prov.searchedWallpapers.photos![index].liked!
                    : prov.wallpapers.photos![index].liked!,
                builder: (context, favorited, _) {
                  return Icon(
                    favorited
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    size: 30,
                  );
                }),
          ),
          SizedBox(width: 20)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Provider.of<HomeScreenController>(context, listen: false)
              .download(imageUrl);
        },
        label: const Text('download'),
        icon: const Icon(Icons.download_for_offline_rounded, size: 30),
        backgroundColor: Colors.pinkAccent[100],
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
