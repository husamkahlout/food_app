import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/data/api/Meal_Data.dart';
import 'package:food_api/models/meal.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/providers/dio_provider.dart';
import 'package:food_api/views/screens/home/categories/meal_details_screen.dart';
import 'package:food_api/views/screens/search/search_box.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:food_api/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleSpacing: 0,
        elevation: 3,
        title: const Text(
          "Search ",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer2<DioProvider, AuthProvider>(
            builder: (context, dioProvider, authProvider, x) {
          return Column(
            children: [
              SearchBox(
                onChanged: (value) {
                  dioProvider.searchController.text = value;
                  setState(() {
                    
                  });
                },
              ),
              SizedBox(
                height: 1500,
                child: FutureBuilder<List<MealModel>>(
                  future: MealData.getMealByFirstChar(
                      dioProvider.searchController.text),
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount:
                              snapshot.hasData ? snapshot.data!.length : 33,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MealDetailsScreen(
                                            MealID: snapshot.data![index].idMeal
                                                .toString())));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.grey.shade300,
                                          image: snapshot.hasData
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                    snapshot.data![index]
                                                        .strMealThumb!,
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
                                                  snapshot
                                                      .data![index].strMeal!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                        BorderRadius.circular(
                                                            7),
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              snapshot.hasData
                                                  ? Text(
                                                      snapshot.data![index]
                                                              .strCategory! +
                                                          ' - ' +
                                                          snapshot.data![index]
                                                              .strArea!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade500,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 15,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
