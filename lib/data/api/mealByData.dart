// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'package:dio/dio.dart';
import 'package:food_api/models/mealsByCategory.dart';

class MealByData {
  static Future<List<MealsByCategoryModel>> getMealByCategory(
      String CategoryName) async {
    Response response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$CategoryName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategoryModel.fromJson(e))
        .toList();
  }

  static Future<List<MealsByCategoryModel>> getMealByArea(String AreaName) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/filter.php?a=$AreaName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategoryModel.fromJson(e))
        .toList();
  }

  static Future<List<MealsByCategoryModel>> getMealByIntegration(
      String ingredientName) async {
    Response response = await Dio().get(
        'http://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredientName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategoryModel.fromJson(e))
        .toList();
  }
}
