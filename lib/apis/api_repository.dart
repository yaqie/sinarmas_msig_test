import 'package:sinarmas_msig_test/models/covid.model.dart';
import 'package:sinarmas_msig_test/models/food.model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<FoodModel> fetchFoodList() {
    return _provider.fetchFoodList();
  }

  Future<FoodModel> fetchFoodDetail(id) {
    return _provider.fetchFoodDetail(id);
  }
}

class NetworkError extends Error {}
