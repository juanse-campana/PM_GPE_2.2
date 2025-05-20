import 'package:flutter/material.dart';
import 'package:dona_app/screens/home_screen.dart'; // Importa la clase Dona

class DonaDetailScreen extends StatelessWidget {
  final Dona dona;

  DonaDetailScreen({required this.dona});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dona.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(dona.image, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              dona.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$${dona.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 15),
            Text(dona.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para agregar al carrito
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('¡${dona.name} agregada al carrito!'),
                    ),
                  );
                },
                child: Text('Agregar al Carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
