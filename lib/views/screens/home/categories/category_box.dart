import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_api/models/category.dart';
import 'package:food_api/providers/dio_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/home/categories/categories_screen.dart';
import 'package:food_api/views/screens/home/categories/category_meals_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(builder: (context, dioProvider, x) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dioProvider.categories.isEmpty == false
                    ? const Text(
                        "Categories",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : Container(
                        height: 15,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade300,
                        ),
                      ),
                dioProvider.categories.isNotEmpty
                    ? TextButton(
                        onPressed: () =>
                            AppRouter.navigateToWidget(CategoryScreen()),
                        child: const Text(
                          'view All',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Container(
                        height: 15,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade300,
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(
              height: 150,
              child: dioProvider.categories.isEmpty ?
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ( context, int ) {
                  return emptyContainer();
                },
              )
             : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dioProvider.categories.length - 2,
                itemBuilder: (context, index) {
                  return CategoyWidget(dioProvider.categories[index]);
                },
              )),
        ],
      );
    });
  }
}

Widget emptyContainer() {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 0, top: 20, bottom: 20),
    height: 10,
    width: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: Colors.grey.shade300,
    ),
  );
}

class CategoyWidget extends StatelessWidget {
  CategoryModel categoryModel;
  CategoyWidget(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 0, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              color: const Color(0xFFB0CCE1).withOpacity(0.32),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Builder(builder: (context) {
            return InkWell(
              onTap: () {
                AppRouter.navigateToWidget(CategoryMeals(
                  categoryName: categoryModel.categoryName!,
                  filterType: "Category",
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          categoryModel.categoryImage!,
                          width: size.width * 0.20,
                          // size.width * 0.18 means it use 18% of total width
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categoryModel.categoryName!,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
  }
}
