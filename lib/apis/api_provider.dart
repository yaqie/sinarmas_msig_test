import 'package:dio/dio.dart';
import 'package:sinarmas_msig_test/models/covid.model.dart';
import 'package:sinarmas_msig_test/models/food.model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<FoodModel> fetchFoodList() async {
    try {
      Response response = await _dio
          .get('https://www.themealdb.com/api/json/v1/1/search.php?s=');
      return FoodModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FoodModel.withError("Data not found / Connection issue");
    }
  }

  Future<FoodModel> fetchFoodDetail(id) async {
    try {
      Response response = await _dio
          .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
      return FoodModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FoodModel.withError("Data not found / Connection issue");
    }
  }
}
