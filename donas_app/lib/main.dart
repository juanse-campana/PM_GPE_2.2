// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donas_app/theme_provider.dart';
import 'package:donas_app/screens/main_screen.dart';
import 'package:donas_app/screens/menu_screen.dart';

void main() {
  runApp(
    MultiProvider( // Usamos MultiProvider para gestionar múltiples proveedores
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationBarProvider()), // Nuevo proveedor para el BottomNavBar
        // Aquí podrías añadir un CartProvider en el futuro si decides implementarlo
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Dona App',
      debugShowCheckedModeBanner: false, // Opcional: para quitar la bandera de debug
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          color: Colors.brown[50],
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        scaffoldBackgroundColor: Colors.brown[50],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.brown[800]),
          bodyMedium: TextStyle(color: Colors.brown[700]),
          titleLarge: TextStyle(
            color: Colors.brown[900],
            fontWeight: FontWeight.bold,
          ),
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData( // Estilos para el BottomNavigationBar
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.brown[100], // Fondo claro para el BottomNavBar en tema claro
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedIconTheme: const IconThemeData(size: 24),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          color: Colors.brown[900],
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white60),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData( // Estilos para el BottomNavigationBar
          selectedItemColor: Colors.amber, // Un color que resalte en el tema oscuro
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Colors.grey[850], // Fondo oscuro para el BottomNavBar en tema oscuro
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedIconTheme: const IconThemeData(size: 24),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: MainScreen(), // ¡Este es el nuevo punto de entrada!
    );
  }
}