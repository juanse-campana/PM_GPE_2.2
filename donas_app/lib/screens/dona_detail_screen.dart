import 'package:flutter/material.dart';
// Importa la clase Dona desde home_screen.dart, ya que la definiste allí
import 'package:donas_app/screens/menu_screen.dart';

class DonaDetailScreen extends StatelessWidget {
  final Dona dona;

  DonaDetailScreen({super.key, required this.dona});

  @override
  Widget build(BuildContext context) {
    // Accede a los colores del tema actual
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
              style: textTheme.titleLarge, // Usa el estilo de texto del tema
            ),
            const SizedBox(height: 10),
            Text(
              '\$${dona.price.toStringAsFixed(2)}',
              style: textTheme.bodyMedium!.copyWith(color: colorScheme.secondary), // Usa un color secundario del tema
            ),
            const SizedBox(height: 15),
            Text(
              dona.description,
              style: textTheme.bodyMedium, // Usa el estilo de texto del tema
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('¡${dona.name} agregada al carrito!'),
                    ),
                  );
                },
                // El estilo del botón ya se define en ThemeData en main.dart
                child: const Text('Agregar al Carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}