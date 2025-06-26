// lib/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donas_app/screens/menu_screen.dart';
import 'package:donas_app/screens/cart_screen.dart';
import 'package:donas_app/screens/profile_screen.dart';
import 'package:donas_app/bottom_navigation_bar_provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // Lista de las pantallas que se mostrarán en cada pestaña
  final List<Widget> _screens = [
    MenuScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Escucha el índice actual del BottomNavigationBarProvider
    final navBarProvider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: IndexedStack( // IndexedStack mantiene el estado de las pantallas
        index: navBarProvider.currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navBarProvider.currentIndex,
        onTap: (index) {
          navBarProvider.setIndex(index); // Actualiza el índice seleccionado
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        // Los colores se pueden definir aquí o en el tema de la aplicación
        // selectedItemColor: Theme.of(context).primaryColor,
        // unselectedItemColor: Colors.grey,
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
  }
}