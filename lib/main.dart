import 'package:coffe_app/data/repository.dart';
import 'package:coffe_app/screens/coffee_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoffeeProvider()),
      ],
      child: const MaterialApp(
        home: CoffeeMainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
