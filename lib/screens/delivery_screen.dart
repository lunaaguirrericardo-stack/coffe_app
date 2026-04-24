import 'package:coffe_app/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  void initState() {
    super.initState();
    // Cargamos los datos al iniciar la pantalla
    Future.microtask(() => context.read<CoffeeProvider>().fetchCoffeeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú de Cafés')),
      body: Consumer<CoffeeProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }

          return ListView.builder(
            itemCount: provider.coffees.length,
            itemBuilder: (context, index) {
              final coffee = provider.coffees[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: coffee.image != null && coffee.image!.isNotEmpty
                        ? Image.network(
                            coffee.image!,
                            width: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                Icon(Icons.coffee_outlined),
                          )
                        : Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey.shade200,
                            child: Icon(Icons.coffee_outlined, size: 32),
                          ),
                  ),
                  title: Text(
                    coffee.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(coffee.country),
                  onTap: () {
                    // Aquí podrías navegar al detalle del café
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
