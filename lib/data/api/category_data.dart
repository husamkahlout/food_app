import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_api/models/category.dart';
import 'package:food_api/models/mealsByCategory.dart';

class DioHelper {
  DioHelper._();
  static DioHelper dioHelper = DioHelper._();
  Dio dioInstance = Dio();
// ======================================== Categories ================================================

  Future<List<CategoryModel>> getAllCategories() async {
    String categoriesUrl =
        "https://www.themealdb.com/api/json/v1/1/categories.php";
    Response response = await dioInstance.get(categoriesUrl);
    List categories = response.data["categories"];
    // convert list of maps to list of categories
    List<CategoryModel> categoriesList = categories.map((e) {
      return CategoryModel.fromJson(e);
    }).toList();
    return categoriesList;
  }

  Future<List<String>> getCategoryTitle() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');
    List<String> categoryTilteList = [];
    for (int i = 0; i < response.data['categories'].length; i++) {
      categoryTilteList.add(response.data['categories'][i]['strCategory']);
    }
    return categoryTilteList;
  }

// ======================================== Meals ================================================

  Future<List<MealsByCategoryModel>> getMealsByCategory(String categoryName) async {
    Response response = await dioInstance
        .get("www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName");
    List meals = response.data['meals'];
    List<MealsByCategoryModel> mealsByCategory = meals.map((e) {
      return MealsByCategoryModel.fromJson(e);
    }).toList();
    return mealsByCategory;
  }
}
