import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_eyesight/logic/providers/home_screen_controller.dart';
import 'package:my_eyesight/models/wallpaper_model.dart';
import 'package:my_eyesight/view_ui/wallpaper_details_screen.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My favorite!"),
        titleTextStyle: TextStyle(color: Colors.grey[600], fontSize: 20),
        backgroundColor: Colors.tealAccent,
        elevation: 2.5,
        iconTheme: IconThemeData(color: Colors.grey[600]),
      ),
      body: FutureBuilder<List<Photo>>(
        future: Provider.of<HomeScreenController>(context, listen: false)
            .getFavoritesList(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8),
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => WallpaperDetailsScreen(
                                imageUrl: snapshot.data![index].src!.portrait,
                                index: index,
                                isFromSearch: true,
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                          fit: BoxFit.cover,
                          imageUrl: snapshot.data![index].src!.tiny!,
                        ),
                      ),
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            print("the error is ${snapshot.error}");
            return const Center(
              child: Text("something went worng"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
