import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'package:donas_app/screens/home_screen.dart';
import 'package:donas_app/theme_provider.dart'; // Importa el ThemeProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios en el ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Dona App',
      themeMode: themeProvider.themeMode, // Usa el themeMode del proveedor
      theme: ThemeData(
        brightness: Brightness.light, // Tema claro
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          color: Colors.brown[50], // Un color claro para las tarjetas
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        scaffoldBackgroundColor:
            Colors.brown[50], // Fondo claro para el Scaffold
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.brown[800]),
          bodyMedium: TextStyle(color: Colors.brown[700]),
          titleLarge: TextStyle(
            color: Colors.brown[900],
            fontWeight: FontWeight.bold,
          ),
          // Puedes añadir más estilos de texto aquí
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
        primarySwatch:
            Colors.brown, // Sigue usando brown, pero el brillo lo adaptará
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors
                  .brown, // Puedes cambiar esto a un color más oscuro si prefieres
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          color: Colors.brown[900], // Un color oscuro para las tarjetas
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        scaffoldBackgroundColor:
            Colors.grey[900], // Fondo oscuro para el Scaffold
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white60),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          // Puedes añadir más estilos de texto aquí
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
