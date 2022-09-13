import 'package:drift/native.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinarmas_msig_test/bloc/food_bloc/food_bloc.dart';
import 'package:sinarmas_msig_test/components/image_error.dart';
import 'package:sinarmas_msig_test/drift/fav.dart';
import 'package:sinarmas_msig_test/models/covid.model.dart';
import 'package:sinarmas_msig_test/models/food.model.dart';
import 'package:sinarmas_msig_test/pages/fav.page.dart';
import 'package:sinarmas_msig_test/pages/food_detail.page.dart';
import 'package:drift/drift.dart' as drift;

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Database _db;
  final FoodBloc _newsBloc = FoodBloc();

  @override
  void initState() {
    _db = Database();
    _newsBloc.add(GetFoodList());
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
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavPage()),
                );
              },
              icon: const Icon(Icons.favorite)),
        )
      ], title: const Text('Food List')),
      body: _buildListFood(),
    );
  }

  Widget _buildListFood() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<FoodBloc, FoodState>(
          listener: (context, state) {
            if (state is FoodError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodInitial) {
                return _buildLoading();
              } else if (state is FoodLoading) {
                return _buildLoading();
              } else if (state is FoodLoaded) {
                return _buildCard(context, state.foodModel);
              } else if (state is FoodError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, FoodModel model) {
    return ListView.builder(
      itemCount: model.meals!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FoodDetailPage(id: model.meals![index].idMeal)),
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
                            imageUrl: model.meals![index].strMealThumb!,
                            errorWidget: const ImageNotFoundWidget()),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Food: ${model.meals![index].strMeal}"),
                            Text(
                                "Category: ${model.meals![index].strCategory}"),
                            Text("Area: ${model.meals![index].strArea}"),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border_outlined),
                      onPressed: () async {
                        const snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Save favorite success!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        final entity = FavoritesCompanion(
                            idFood: drift.Value(model.meals![index].idMeal!),
                            image:
                                drift.Value(model.meals![index].strMealThumb!),
                            title: drift.Value(model.meals![index].strMeal!),
                            category:
                                drift.Value(model.meals![index].strCategory!),
                            area: drift.Value(model.meals![index].strArea!));

                        _db.insertFavorite(entity);
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

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
