class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? categoryImage;
  String? categoryDescription;

  CategoryModel(
    { this.categoryId,
      this.categoryName,
      this.categoryImage,
      this.categoryDescription});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['idCategory'];
    categoryName = json['strCategory'];
    categoryImage = json['strCategoryThumb'];
    categoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['idCategory'] = categoryId;
    data['strCategory'] = categoryName;
    data['strCategoryThumb'] = categoryImage;
    data['strCategoryDescription'] = categoryDescription;
    return data;
  }
}
