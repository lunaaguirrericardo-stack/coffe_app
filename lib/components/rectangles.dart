import 'package:flutter/material.dart';

class Rectangles {
  static Widget rectangle1 = Container(
    width: 120,
    height: 30,
    decoration: BoxDecoration(
      color: const Color.fromARGB(114, 201, 109, 33),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static Widget rectangle2 = Container(
    width: 150,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.brown[300],
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
