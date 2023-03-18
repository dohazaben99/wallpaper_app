import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_eyesight/view_ui/wallpaper_details_screen.dart';
import 'package:provider/provider.dart';

import '../logic/providers/home_screen_controller.dart';
import '../models/wallpaper_model.dart';

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
            duration: Duration(microseconds: 1), curve: Curves.linear);
        Provider.of<HomeScreenController>(context, listen: false)
            .loadMoreData();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    listViewListener();

    Provider.of<HomeScreenController>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.5,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.pinkAccent,
                size: 28,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/favorites_screen");
              },
            ),
            SizedBox(width: 15),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.of(context).pushNamed("/search_screen");
          },
          label: const Text('Search'),
          icon: const Icon(Icons.search),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Consumer<HomeScreenController>(builder: (context, wallpaper, _) {
          return wallpaper.wallpapers.photos == null
              ? const Center(child: CircularProgressIndicator())
              : wallpaper.wallpapers.photos!.isEmpty
                  ? const Center(
                      child: Text("no images"),
                    )
                  : GridView.builder(
                      controller: _controller,
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 20),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 8),
                      itemCount: wallpaper.wallpapers.photos!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => WallpaperDetailsScreen(
                                      imageUrl: wallpaper.wallpapers
                                          .photos![index].src!.portrait,
                                      index: index,
                                    )));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                fit: BoxFit.cover,
                                imageUrl: wallpaper
                                    .wallpapers.photos![index].src!.tiny!,
                              ),
                            ),
                          ),
                        );
                      });
        }));
  }
}
