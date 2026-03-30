import 'package:flutter/material.dart';

class ImageLogon extends StatelessWidget {
  const ImageLogon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/coffee_image.png'),
      height: 200,
    );
  }
}
