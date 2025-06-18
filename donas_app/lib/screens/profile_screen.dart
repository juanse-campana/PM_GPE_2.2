// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donas_app/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                // Asegúrate de tener 'assets/user_avatar.png' o comenta esta línea
                // para usar solo el icono como fallback.
                // backgroundImage: AssetImage('assets/user_avatar.png'),
                child: Icon(Icons.person, size: 80, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Nombre de Usuario', // Puedes reemplazar esto con datos dinámicos
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Ajustes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
                activeColor: Colors.amber,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historial de Pedidos'),
              onTap: () {
                // Navegar al historial de pedidos
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navegar a historial de pedidos')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                // Lógica para cerrar sesión
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cerrando sesión...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}