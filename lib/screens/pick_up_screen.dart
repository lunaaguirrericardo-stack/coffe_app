import 'package:coffe_app/components/carousel.dart';
import 'package:coffe_app/components/custom_cards.dart';
import 'package:coffe_app/components/rectangles.dart';
import 'package:coffe_app/core/widgets_styles.dart';
import 'package:coffe_app/screens/Espresso/espresso.dart';
import 'package:flutter/material.dart';

class PickUpScreen extends StatefulWidget {
  const PickUpScreen({super.key});

  @override
  State<PickUpScreen> createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyles.coffeeAppBar(
        title: 'Welcome Coffee Lovers!',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28, top: 4.0),
            child: Icon(Icons.coffee, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Rectangles.rectangle1,
                  SizedBox(width: 8),
                  Rectangles.rectangle1,
                  SizedBox(width: 8),
                  Rectangles.rectangle1,
                ],
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Check out our traditional coffee menu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),

              CarouselWidget(),

              SizedBox(height: 30),

              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      child: CoffeeListItem(
                        name: 'Espresso',
                        description:
                            'Café oscuro y fuerte, extraído bajo presión. Perfecto para amantes del café intenso.',
                        price: '\$3.99',
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EspressoScreen()));
                      },
                    ),
                    CoffeeListItem(
                      name: 'Americano',
                      description:
                          'Espresso diluido en agua caliente. Suave pero con cuerpo y sabor profundo.',
                      price: '\$4.49',
                    ),
                    CoffeeListItem(
                      name: 'Cappuccino',
                      description:
                          'Espresso con leche vapor y crema. Cremoso y delicioso con balance perfecto.',
                      price: '\$5.49',
                    ),
                    CoffeeListItem(
                      name: 'Latte',
                      description:
                          'Espresso con mucha leche vapor. Suave y cremoso, ideal para principiantes.',
                      price: '\$5.49',
                    ),
                    CoffeeListItem(
                      name: 'Macchiato',
                      description:
                          'Espresso "manchado" con espuma de leche. Balance entre intensidad y suavidad.',
                      price: '\$4.99',
                    ),
                    CoffeeListItem(
                      name: 'Flat White',
                      description:
                          'Espresso con leche microespumada. Textura sedosa y sabor concentrado.',
                      price: '\$5.99',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

