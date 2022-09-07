import 'package:flutter/cupertino.dart';
import 'package:food_api/data/api/Area_Data.dart';
import 'package:food_api/data/api/category_data.dart';
import 'package:food_api/data/api/mealByData.dart';
import 'package:food_api/data/api/meal_data.dart';
import 'package:food_api/models/category.dart';
import 'package:food_api/models/meal.dart';
import 'package:food_api/models/mealsByCategory.dart';
import 'package:provider/provider.dart';

class DioProvider extends ChangeNotifier {
  GlobalKey<FormState> searchKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
// ======================================== Categories ================================================
  DioProvider() {
    getAllCategories();
    getCategoryTitle();
    getArea();
    // notifyListeners();
  }
  List<CategoryModel> categories = [];
  Future<List<CategoryModel>> getAllCategories() async {
    return categories = await DioHelper.dioHelper.getAllCategories();
  }

  List<String> categoryTilteList = [];
  getCategoryTitle() async {
    categoryTilteList = await DioHelper.dioHelper.getCategoryTitle();
    notifyListeners();
  }

// ======================================== Meals ================================================
  List<MealsByCategoryModel> mealsByCategory = [];
  getMealsByCategory(String categoryName) async {
    mealsByCategory =
        await DioHelper.dioHelper.getMealsByCategory(categoryName);
    notifyListeners();
  }

// =============================== Area List =======================================
  List<String> areaList = [];
  getArea() async {
    areaList = await AreaData.getArea();
    notifyListeners();
  }

  List<MealModel> searchList = [];
  getMealsByFirstChar() async {
    searchList = await MealData.getMealByFirstChar(searchController.text);
    notifyListeners();
  }
}
