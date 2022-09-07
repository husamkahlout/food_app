import 'package:flutter/material.dart';
import 'package:food_api/data/api/Area_Data.dart';
import 'package:food_api/views/screens/home/components/area_box.dart';
import 'package:food_api/views/screens/home/components/chefs_box.dart';
import 'package:food_api/views/screens/home/components/ad_slider.dart';
import 'package:food_api/views/screens/home/components/app_bar.dart';
import 'package:food_api/views/screens/home/categories/category_box.dart';
import 'package:food_api/views/screens/home/components/watched_box.dart';
import 'package:food_api/views/screens/home/components/food_box.dart';
import 'package:food_api/views/theme/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      body: getBody(),
    );
  }


  Widget getBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AdsSlider(),
        CategoryList(),
        FoodBox(firstChar: "v", boxTitle: "Popular Meals",),
        FoodBox(firstChar: "a", boxTitle: "Recommended",),
        FoodBox(firstChar: "c", boxTitle: "Top Reviews",),
        AreaBox(),
        ChefsBox(),
        const  MostWatchedBox(firstChar: 'h'),
      ],
    ),
    );
  }
}
