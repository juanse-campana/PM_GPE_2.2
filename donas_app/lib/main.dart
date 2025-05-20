import 'package:flutter/material.dart';
import 'package:donas_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dona App', // Cambiado el título de la aplicación
      theme: ThemeData(
        // Utilizamos primarySwatch para una paleta de colores consistente
        primarySwatch: Colors.brown,
        // Personalizamos la AppBar para que coincida con el tema de donas
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown, // Fondo de la AppBar marrón
          foregroundColor:
              Colors.white, // Color del texto y los iconos en la AppBar blanco
          // Puedes añadir más estilos aquí, como el estilo del texto del título
          // titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        // Si quieres definir colores para otras partes de la UI, puedes usar colorScheme
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        // Si usas colorScheme.fromSeed, asegúrate de que se integre bien con tu primarySwatch
      ),
      home:
          HomeScreen(), // ¡Aquí es donde indicamos que nuestra app inicia con la HomeScreen de donas!
    );
  }
}
