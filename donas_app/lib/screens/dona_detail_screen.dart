// lib/screens/dona_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:donas_app/models/dona.dart';
import 'package:provider/provider.dart'; // Importa Provider
import 'package:donas_app/cart_provider.dart'; // Importa tu CartProvider

// La clase Dona ya no necesita ser importada desde menu_screen.dart si la tienes en models/dona.dart
// import 'package:donas_app/screens/menu_screen.dart'; // Elimina si Dona está en models/dona.dart

class DonaDetailScreen extends StatelessWidget {
  final Dona dona;

  const DonaDetailScreen({super.key, required this.dona});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(dona.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(dona.image, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              dona.name,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              '\$${dona.price.toStringAsFixed(2)}',
              style: textTheme.bodyMedium!.copyWith(color: colorScheme.secondary),
            ),
            const SizedBox(height: 15),
            Text(
              dona.description,
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Accede al CartProvider usando Provider.of y el listen: false para no reconstruir el widget
                  Provider.of<CartProvider>(context, listen: false).addItem(dona);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('¡${dona.name} agregada al carrito!'),
                      duration: const Duration(seconds: 1), // Opcional: duración más corta
                    ),
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