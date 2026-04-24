import 'package:coffe_app/components/Imagen.dart';
import 'package:coffe_app/core/text_styles.dart';
import 'package:coffe_app/screens/delivery_screen.dart';
import 'package:coffe_app/screens/pick_up_screen.dart';
import 'package:flutter/material.dart';

class CoffeeMainScreen extends StatefulWidget {
  const CoffeeMainScreen({super.key});

  @override
  State<CoffeeMainScreen> createState() => _CoffeeMainScreenState();
}

class _CoffeeMainScreenState extends State<CoffeeMainScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  double _currentRotation = 0; // Rotación acumulada
  double _previousRotation = 0; // Rotación anterior para la interpolación

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _rotateLogoCW() {
    // Girar 90 grados hacia la derecha
    _previousRotation = _currentRotation;
    _currentRotation += 1.5708; // 90 grados en radianes (π/2)

    _rotationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 132, 97),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _rotateLogoCW,
              child: AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) {
                  // Aplicar una curva suave a la animación
                  final curvedValue = Curves.easeInOut.transform(
                    _rotationController.value,
                  );
                  final smoothRotation =
                      _previousRotation + (1.5708 * curvedValue);

                  return Transform.rotate(angle: smoothRotation, child: child);
                },
                child: ImageLogon(),
              ),
            ),

            Text('Coffe Shop', style: TextStyles.bodyText),

            Text('Order your favorite coffee', style: TextStyles1.sloganText),

            SizedBox(height: 120),

            SizedBox(
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryScreen(),
                  ),
                ),
                child: Text('Order to deliver', style: TextStyles2.buttonText),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PickUpScreen()),
                ),
                child: Text('Our Menu', style: TextStyles2.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
