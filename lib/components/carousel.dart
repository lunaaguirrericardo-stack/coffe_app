import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/coffee_1.png',
      'assets/coffee_2.png',
      'assets/coffee_3.png',
    ];
    return CarouselSlider(
      items: imagePaths.map((path) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(path, fit: BoxFit.cover, width: 1000),
        );
      }).toList(),
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 10),
      ),
    );
  }
}
