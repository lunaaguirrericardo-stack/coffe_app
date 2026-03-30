import 'package:flutter/material.dart';


//Clases para estilos reutilizables en la aplicación, como AppBar y contenedores personalizados.
class AppBarStyles {

  static AppBar coffeeAppBar({
    required String title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    bool centerTitle = true,
    Color backgroundColor = const Color(0xFF5D3A1A),
  }) {

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: 4,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: actions,
      bottom: bottom,
    );
  }
}

//Clase para estilos de contenedores personalizados, como el contenedor de café con imagen y texto.

class ContainerStyles {

    static Container coffeeContainer({
      required String title,
      required Container container,
      required Image coffeetype,
    }) {
      
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            coffeetype,

            SizedBox(height: 20),

            Text(title, style: TextStyle(fontSize: 18, color: Colors.brown[800], fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }
  }