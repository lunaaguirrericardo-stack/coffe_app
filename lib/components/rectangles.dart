import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

Widget rectangle1({
  required Size size,
  required void Function()? onTap,
}) {
  return CustomCard(
    height: 30,
    borderRadius: 10,
    width: size.width * .27,
    color: const Color.fromARGB(114, 201, 109, 33),
    onTap: onTap,
  );
}
