// lib/screens/cart_screen.dart

import 'package:donas_app/cart_provider.dart';
import 'package:donas_app/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donas_app/models/dona.dart'; // Importa el modelo Dona
import 'package:donas_app/models/cart_item.dart'; // Importa el modelo CartItem

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Mi Carrito'),
          ),
          body: cart.items.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                      SizedBox(height: 20),
                      Text(
                        'Tu carrito está vacío',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('¡Añade algunas donas deliciosas!'),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          // La variable 'cartItem' es de tipo CartItem
                          final cartItem = cart.items[index];
                          return ListTile(
                            // <-- CORRECCIÓN: Accedemos a la dona a través de cartItem.dona
                            leading: Image.asset(cartItem.dona.image, width: 50, height: 50, fit: BoxFit.cover),
                            title: Text(cartItem.dona.name),
                            subtitle: Text('\$${cartItem.dona.price.toStringAsFixed(2)}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                              onPressed: () {
                                // <-- CORRECCIÓN: Pasamos el objeto Dona al método removeItem
                                cart.removeItem(cartItem.dona);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                '\$${cart.totalPrice.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                NotificationService().cancelNotification();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('¡Gracias por tu compra!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                cart.clearCart();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Pagar Ahora'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}