import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsSlider extends StatelessWidget {

  List<String> urlImageAds = [
    'assets/sliders/slider1.jpg',
    'assets/sliders/slider2.jpg',
    'assets/sliders/slider3.jpg',
    'assets/sliders/slider4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: urlImageAds.length,
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          reverse: false,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 4),
        ),
        itemBuilder: (context, index, realindex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        urlImageAds[index],
                      ),
                      fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      color: Color.fromARGB(117, 0, 0, 0),
                    )
                  ]),
            ),
          );
        });
  }
}