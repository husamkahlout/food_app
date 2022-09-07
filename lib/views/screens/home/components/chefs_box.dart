import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_api/views/theme/theme.dart';

class ChefsBox extends StatelessWidget {

  List<String> urlImageGroup = [
    "assets/chefs/1.jpg",
    "assets/chefs/2.jpg",
    "assets/chefs/3.jpg",
    "assets/chefs/4.jpg",
    "assets/chefs/5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Our Chefs",
            style:  TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        CarouselSlider.builder(
            itemCount: urlImageGroup.length,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              reverse: false,
              enlargeCenterPage: true,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlayInterval: const Duration(seconds: 4),
            ),
            itemBuilder: (context, index, realindex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 7,
                        color: Color.fromARGB(141, 0, 0, 0),
                      )
                    ],
                    color: kPrimaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage(
                            urlImageGroup[index],           
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
