import 'package:flutter/material.dart';

import 'package:coffe_app/core/widgets_styles.dart';
import 'package:coffe_app/components/carousel.dart';
import 'package:coffe_app/components/rectangles.dart';
import 'package:coffe_app/components/custom_cards.dart';
import 'package:coffe_app/screens/coffe_details/coffe_details_screen.dart';

class PickUpScreen extends StatefulWidget {
  const PickUpScreen({super.key});

  @override
  State<PickUpScreen> createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {

  //Variables a manejar para los productos
  List<Map<String, dynamic>> coffeMenu = [
    {
      'name': 'Espresso',
      'description': 'Café oscuro y fuerte, extraído bajo presión. Perfecto para amantes del café intenso.',
      'price': '\$3.99',
      'image': 'assets/coffee_1.png'
    },
    {
      'name': 'Americano',
      'description': 'Espresso diluido en agua caliente. Suave pero con cuerpo y sabor profundo.',
      'price': '\$4.49',
      'image': 'assets/coffee_2.png'
    },
    {
      'name': 'Cappuccino',
      'description': 'Espresso con leche vapor y crema. Cremoso y delicioso con balance perfecto.',
      'price': '\$5.49',
      'image': 'assets/coffee_3.png'
    },
    {
      'name': 'Latte',
      'description': 'Espresso con mucha leche vapor. Suave y cremoso, ideal para principiantes.',
      'price': '\$5.49',
      'image': 'assets/coffee_4.png'
    },
    {
      'name': 'Macchiato',
      'description': 'Espresso "manchado" con espuma de leche. Balance entre intensidad y suavidad.',
      'price': '\$4.99',
      'image': null
    },
    {
      'name': 'Flat White',
      'description': 'Espresso con leche microespumada. Textura sedosa y sabor concentrado.',
      'price': '\$5.99',
      'image': null
    },
  ];
  
  bool isTraditionalSelected = true;
  bool isSecondSelected = false;
  bool isThirdSelected = false;

  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
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
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              //OPCIONES DE TIPO DE CAFE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  rectangle1(
                    size: size, 
                    onTap: () {
                      setState(() {
                        isTraditionalSelected = true;
                        isSecondSelected = false;
                        isThirdSelected = false;
                      });
                    },
                  ),
                  rectangle1(
                    size: size,
                    onTap: () {
                      setState(() {
                        isTraditionalSelected = false;
                        isSecondSelected = true;
                        isThirdSelected = false;
                      });
                    },
                  ),
                  rectangle1(
                    size: size,
                    onTap: () {
                      setState(() {
                        isTraditionalSelected = false;
                        isSecondSelected = false;
                        isThirdSelected = true;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              //TITULO DE LA SECCION
              SizedBox(
                width: size.width * 0.8,
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

              //LISTA DE PRODUCTOS
              Expanded(
                child: ListView.builder(
                  itemCount: coffeMenu.length,
                  itemBuilder: (context, index){
                      final coffee = coffeMenu[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => CoffeDetailsScreen(
                            coffeeName: coffee['name'],
                            coffeeDescription: coffee['description'],
                            coffeeImage: coffee['image'] ?? 'assets/coffee_1.png',
                            coffeeType: isTraditionalSelected 
                              ? 'Traditional' 
                              : isSecondSelected 
                                ? 'Second Type' 
                                : 'Third Type',
                          )
                        ),
                      ),
                      child: CoffeeListItem(
                        name: coffee['name'],
                        description: coffee['description'],
                        price: coffee['price'],
                      ),
                    );
                  },
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}



