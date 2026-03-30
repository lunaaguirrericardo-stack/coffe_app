import 'package:coffe_app/core/widgets_styles.dart';
import 'package:flutter/material.dart';

class AmericanoScreen extends StatelessWidget {
   
  const AmericanoScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyles.coffeeAppBar(title: "Traditional Coffees"),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_4.png'),
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
                  'Espresso',
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
              'Our espresso is made with the finest Arabica beans, carefully roasted to bring out the rich and bold flavors. Each cup is crafted to perfection, delivering a strong and intense coffee experience that will satisfy even the most discerning coffee lovers.',
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