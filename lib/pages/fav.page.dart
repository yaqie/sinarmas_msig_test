import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:sinarmas_msig_test/components/image_error.dart';
import 'package:sinarmas_msig_test/drift/fav.dart';
import 'package:sinarmas_msig_test/pages/food_detail.page.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late Database _db;
  @override
  void initState() {
    _db = Database();
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Favorite'),
        ),
        body: FutureBuilder<List<Favorite>>(
            future: _db.getFavorites(),
            builder: (context, snapshot) {
              final List<Favorite>? fav = snapshot.data;
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (fav != null) {
                return ListView.builder(
                  itemCount: fav.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FoodDetailPage(id: fav[index].idFood)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    FancyShimmerImage(
                                        width: 100,
                                        height: 100,
                                        imageUrl: fav[index].image,
                                        errorWidget:
                                            const ImageNotFoundWidget()),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Food: ${fav[index].title}"),
                                        Text(
                                            "Category: ${fav[index].category}"),
                                        Text("Area: ${fav[index].area}"),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    await _db.deleteFavorite(fav[index].idFood);
                                    setState(() {
                                      _db.getFavorites();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return const Text('No data found');
            }));
  }
}
