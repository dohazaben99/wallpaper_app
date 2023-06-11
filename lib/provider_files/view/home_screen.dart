import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_eyesight/controller/providers/home_screen_controller.dart';
import 'package:my_eyesight/view/wallpaper_details_screen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _controller;

  listViewListener() {
    _controller = ScrollController();
    _controller.addListener(() {
      bool loadVisible = !_controller.hasClients
          ? false
          : _controller.offset < _controller.position.maxScrollExtent
              ? false
              : true;
      if (loadVisible) {
        _controller.animateTo(_controller.position.maxScrollExtent - 10,
            duration: const Duration(microseconds: 1), curve: Curves.linear);
        Provider.of<HomeScreenController>(context, listen: false)
            .loadMoreData();
      }
    });
  }

  @override
  void initState() {
    listViewListener();
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
    super.initState();
  }

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
                Provider.of<HomeScreenController>(context, listen: false)
                    .clearSearchList();
                Navigator.of(context).pushNamed("/search_screen");
              },
              label: const Text('Search'),
              heroTag: "btn1",
              icon: const Icon(Icons.search),
              backgroundColor: Colors.pinkAccent,
            ),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, "/favorites_screen");
              },
              heroTag: "btn2",
              label: const Text('Favorites'),
              icon: const Icon(Icons.favorite_rounded),
              backgroundColor: Colors.pinkAccent,
            ),
          ],
        ),
        body: SafeArea(
          child:
              Consumer<HomeScreenController>(builder: (context, wallpaper, _) {
            return wallpaper.wallpapers.photos == null
                ? const Center(child: CircularProgressIndicator())
                : wallpaper.wallpapers.photos!.isEmpty
                    ? const Center(child: Text("no images"))
                    : AnimationLimiter(
                        child: GridView.builder(
                            controller: _controller,
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 8),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: wallpaper.wallpapers.photos!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return AnimationConfiguration.staggeredGrid(
                                columnCount: 2,
                                position: index,
                                child: ScaleAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: FadeInAnimation(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    WallpaperDetailsScreen(
                                                      imageUrl: wallpaper
                                                          .wallpapers
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
                                                "${wallpaper.wallpapers.photos![index].photographer}"),
                                            leading: const Icon(
                                                Icons.monochrome_photos),
                                          ),
                                          child: CachedNetworkImage(
                                            progressIndicatorBuilder: (context,
                                                    url, progress) =>
                                                Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            value: progress
                                                                .progress)),
                                            fit: BoxFit.cover,
                                            imageUrl: wallpaper.wallpapers
                                                .photos![index].src!.tiny!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
          }),
        ));
  }
}
