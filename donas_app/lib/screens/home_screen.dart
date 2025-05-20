import 'package:flutter/material.dart';
import 'package:dona_app/screens/dona_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Dona> donas = [
    Dona(name: 'Dona de Chocolate', price: 2.50, image: 'assets/chocolate_dona.png', description: 'Deliciosa dona cubierta de chocolate.'),
    Dona(name: 'Dona Glaseada', price: 2.00, image: 'assets/glaseada_dona.png', description: 'Clásica dona con un dulce glaseado.'),
    Dona(name: 'Dona de Fresa', price: 2.75, image: 'assets/fresa_dona.png', description: 'Exquisita dona con sabor a fresa.'),
    // Agrega más donas aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestras Donas'),
      ),
      body: ListView.builder(
        itemCount: donas.length,
        itemBuilder: (context, index) {
          final dona = donas.elementAt(index);
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(dona.image, fit: BoxFit.cover),
              ),
              title: Text(dona.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('\$${dona.price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonaDetailScreen(dona: dona),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Dona {
  final String name;
  final double price;
  final String image;
  final String description;

  Dona({required this.name, required this.price, required this.image, required this.description});
}