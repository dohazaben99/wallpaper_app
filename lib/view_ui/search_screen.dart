import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_eyesight/view_ui/wallpaper_details_screen.dart';
import 'package:provider/provider.dart';

import '../logic/providers/home_screen_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        print("dhdhhhdhd");
        Provider.of<HomeScreenController>(context, listen: false)
            .loadMoreSearchedData();
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search your choices"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
        backgroundColor: Colors.teal,
        elevation: 2.5,
      ),
      body: Column(
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
                      icon: Icon(Icons.search)),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                onSaved: (value) {
                  print("that value $value");
                  Provider.of<HomeScreenController>(context, listen: false)
                      .fetchSearchedData(value!);
                },
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  print("submition value $value");
                  Provider.of<HomeScreenController>(context, listen: false)
                      .fetchSearchedData(value!);
                },
              ),
            ),
          ),
          Consumer<HomeScreenController>(builder: (context, wallpaper, _) {
            return Expanded(
              child: wallpaper.searchedWallpapers.photos == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      alignment: Alignment.topLeft,
                      child: const Text("Search our gallery now!"),
                    )
                  : GridView.builder(
                      controller: _controller,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 20),
                      itemCount: wallpaper.searchedWallpapers.photos!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 1000),
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              WallpaperDetailsScreen(
                                                imageUrl: wallpaper
                                                    .searchedWallpapers
                                                    .photos![index]
                                                    .src!
                                                    .portrait,
                                                index: index,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: GridTile(
                                    footer: GridTileBar(
                                      backgroundColor: Colors.black26,
                                      title: Text(
                                          "${wallpaper.searchedWallpapers.photos![index].photographer}"),
                                      leading:
                                      const Icon(Icons.monochrome_photos),
                                    ),
                                    child: CachedNetworkImage(
                                      progressIndicatorBuilder:
                                          (context, url, progress) =>
                                          Center(
                                            child: CircularProgressIndicator(
                                                value: progress.progress),
                                          ),
                                      fit: BoxFit.cover,
                                      imageUrl: wallpaper.searchedWallpapers
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
                      }),
            );
          })
        ],
      ),
    );
  }
}
