// lib/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:donas_app/models/dona.dart';
import 'package:donas_app/models/cart_item.dart'; // Importa el nuevo modelo CartItem

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Calcula el número total de ítems en el carrito (contando cantidades)
  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  // Calcula el precio total del carrito
  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addItem(Dona dona) {
    // Busca si la dona ya está en el carrito
    int existingIndex = _items.indexWhere((item) => item.dona.name == dona.name);

    if (existingIndex != -1) {
      // Si ya existe, incrementa la cantidad
      _items[existingIndex].incrementQuantity();
    } else {
      // Si no existe, agrega un nuevo CartItem
      _items.add(CartItem(dona: dona));
    }
    notifyListeners(); // Notifica a los listeners que el carrito ha cambiado
  }

  void removeItem(Dona dona) {
    _items.removeWhere((item) => item.dona.name == dona.name);
    notifyListeners();
  }

  // Puedes añadir métodos para incrementar/decrementar cantidad directamente desde el carrito
  void incrementItemQuantity(CartItem item) {
    item.incrementQuantity();
    notifyListeners();
  }

  void decrementItemQuantity(CartItem item) {
    item.decrementQuantity();
    if (item.quantity == 0) { // Si la cantidad llega a 0, remover el ítem
      _items.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}