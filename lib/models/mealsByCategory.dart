class MealsByCategoryModel {
  String? mealName;
  String? mealImage;
  String? idMeal;

  MealsByCategoryModel({this.mealName, this.mealImage, this.idMeal});

  MealsByCategoryModel.fromJson(Map<String, dynamic> json) {
    mealName = json['strMeal'];
    mealImage = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this.mealName;
    data['strMealThumb'] = this.mealImage;
    data['idMeal'] = this.idMeal;
    return data;
  }
}