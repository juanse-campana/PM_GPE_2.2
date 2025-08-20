import 'package:flutter/material.dart';
import 'package:donas_app/screens/dona_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:donas_app/theme_provider.dart';
import 'package:donas_app/models/dona.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const List<Dona> donas = [
    Dona(
      name: 'Dona de Chocolate',
      price: 2.50,
      image: 'assets/dona_chocolate.jpg',
      description: 'Deliciosa dona cubierta de chocolate.',
    ),
    Dona(
      name: 'Dona Glaseada',
      price: 2.00,
      image: 'assets/dona_glaseada.jpeg',
      description: 'Clásica dona con un dulce glaseado.',
    ),
    Dona(
      name: 'Dona de Fresa',
      price: 2.75,
      image: 'assets/dona_fresa.png',
      description: 'Exquisita dona con sabor a fresa.',
    ),
    // Agrega más donas aquí
  ];

  @override
  Widget build(BuildContext context) {
    // Obtiene el ThemeProvider para acceder y cambiar el tema
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestras Donas'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
            activeColor:
                Colors.amber, // Color del switch cuando está activo (modo oscuro)
          ),
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
            ), // Icono según el tema
            onPressed: () {
              themeProvider.toggleTheme(!isDarkMode); // Alterna el tema
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: donas.length,
        itemBuilder: (context, index) {
          final dona = donas.elementAt(index);
          return Card(
            margin: const EdgeInsets.all(8.0),
            // El color de la Card ahora se toma del tema
            color: Theme.of(context).cardTheme.color,
            child: ListTile(
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(dona.image, fit: BoxFit.cover),
              ),
              title: Text(
                dona.name,
                style:
                    Theme.of(
                      context,
                    ).textTheme.titleLarge, // Usa el estilo de texto del tema
              ),
              subtitle: Text(
                '\${dona.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDarkMode
                          ? Colors.lightGreenAccent
                          : Colors.green, // Color del precio
                    ),
              ),
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

