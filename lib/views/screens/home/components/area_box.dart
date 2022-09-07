import 'package:flutter/material.dart';
import 'package:food_api/data/api/Area_Data.dart';
import 'package:food_api/providers/dio_provider.dart';
import 'package:food_api/views/screens/home/categories/category_meals_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:provider/provider.dart';


class AreaBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Countries",
            style:  TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          width: double.infinity,
          height: 43,
          child: Consumer<DioProvider>(builder: (context, dioProvider, x) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dioProvider.areaList.length,
              itemBuilder: (context, index) {
                return dioProvider.areaList.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryMeals(
                                  categoryName: dioProvider.areaList[index],
                                  filterType: "Area",
                                ),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          margin:
                              const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            dioProvider.areaList[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 15,
                        width: 80,
                        padding:
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        margin: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.shade300,
                        ),
                      );
              },
            );
          }),
        ),
      ],
    );
  }
}
