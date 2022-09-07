import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_api/data/api/mealByData.dart';
import 'package:food_api/models/category.dart';
import 'package:food_api/models/mealsByCategory.dart';
import 'package:food_api/providers/dio_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/home/categories/meal_details_screen.dart';
import 'package:provider/provider.dart';

class CategoryMeals extends StatelessWidget {
  String? categoryName;
  String filterType;
  // MealsByCategory? mealsByCategory;
  CategoryMeals({
    required this.categoryName,
    required this.filterType,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
          titleSpacing: 0,
          title: Text(
            "$categoryName Meals",
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<DioProvider>(builder: (context, dioProvider, x) {
          return FutureBuilder<List<MealsByCategoryModel>>(
            future: filterType == 'Category'
                ? MealByData.getMealByCategory(categoryName!)
                : filterType == 'Area'
                    ? MealByData.getMealByArea(categoryName!)
                    : filterType == 'Ingredient'
                        ? MealByData.getMealByIntegration(categoryName!)
                        : null,
            builder: (context, snapshot) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: snapshot.hasData ? snapshot.data!.length : 33,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            AppRouter.navigateToWidget(MealDetailsScreen(MealID: snapshot.data![index].idMeal.toString(),));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 5, top: 5, bottom: 5, right: 5),
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                    color: Color.fromARGB(76, 0, 0, 0),
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey.shade300,
                                      image: snapshot.hasData
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                snapshot
                                                    .data![index].mealImage!,
                                              ),
                                              fit: BoxFit.cover)
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      snapshot.hasData
                                          ? Text(
                                              snapshot.data![index].mealName!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            )
                                          : Container(
                                              height: 15,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: Colors.grey.shade300,
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
            },
          );
        }));
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //     backgroundColor: Colors.white,
  //     iconTheme: const IconThemeData(color: Colors.black87),
  //     elevation: 0,
  //     titleSpacing: 0,
  //     title: Text("${categoryModel.categoryName} Meals",style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),)
  //     ),
  //   body: Consumer<DioProvider>(
  //     builder: (context, dioProvider, x) {
  //       return Column(
  //         children: List.generate(dioProvider.mealsByCategory.length, (index)  {
  //           return Text(dioProvider.mealsByCategory[index].mealName!);
  //         }),
  //       );
  //     }
  //   ),
  //     );

  // }
}
