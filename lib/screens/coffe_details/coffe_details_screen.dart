import 'package:flutter/material.dart';

import 'package:coffe_app/core/widgets_styles.dart';

class CoffeDetailsScreen extends StatefulWidget {
    final String coffeeType;
    final String coffeeName;
    final String coffeeImage;
    final String coffeeDescription;
  const CoffeDetailsScreen({super.key, required this.coffeeName, required this.coffeeImage, required this.coffeeDescription, required this.coffeeType});

  @override
  State<CoffeDetailsScreen> createState() => _CoffeDetailsScreenState();
}

class _CoffeDetailsScreenState extends State<CoffeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyles.coffeeAppBar(title: widget.coffeeType),
      body: Column(

        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.coffeeImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withValues(alpha: 0.6),
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  widget.coffeeName,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
    
          SizedBox(height: 20),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.coffeeDescription,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[800],
              ),
            ),
          ),
        ],
      )
    );
  }
}