// lib/screens/dona_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:donas_app/models/dona.dart';
import 'package:provider/provider.dart';
import 'package:donas_app/cart_provider.dart';

class DonaDetailScreen extends StatelessWidget {
  final Dona dona;

  const DonaDetailScreen({super.key, required this.dona});

  @override
  Widget build(BuildContext context) {
    // ... (El código de Theme es el mismo)
    return Scaffold(
      appBar: AppBar(title: Text(dona.name)), // CAMBIO
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Image.asset(dona.image, height: 200, fit: BoxFit.cover)), // CAMBIO
            const SizedBox(height: 20),
            Text(dona.name, style: Theme.of(context).textTheme.titleLarge), // CAMBIO
            const SizedBox(height: 10),
            Text('\$${dona.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyMedium), // CAMBIO
            const SizedBox(height: 15),
            Text(dona.description, style: Theme.of(context).textTheme.bodyMedium), // CAMBIO
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addItem(dona);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('¡${dona.name} agregada al carrito!')), // CAMBIO
                  );
                },
                child: const Text('Agregar al Carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}