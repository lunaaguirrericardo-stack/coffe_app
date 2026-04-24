import 'dart:convert';
import 'package:coffe_app/data/model/coffees_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoffeeProvider with ChangeNotifier {
  List<Coffee> _coffees = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Coffee> get coffees => _coffees;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCoffeeData() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse(
      'https://raw.githubusercontent.com/GabrielDonas/coffee-shop/master/server/data/products.json',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // 1. Decodificamos el mapa completo
        final Map<String, dynamic> decodedData = json.decode(response.body);

        // 2. Accedemos a la lista que está dentro de la llave 'products'
        final List<dynamic> productsList = decodedData['products'];

        // 3. Mapeamos esa lista a nuestro modelo
        _coffees = productsList.map((item) => Coffee.fromJson(item)).toList();
      }
    } catch (e) {
      _errorMessage = 'Error al cargar productos';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
