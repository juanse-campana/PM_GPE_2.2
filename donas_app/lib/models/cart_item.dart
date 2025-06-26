// lib/models/cart_item.dart
import 'package:donas_app/models/dona.dart'; // Asegúrate de que esta ruta sea correcta

class CartItem {
  final Dona dona;
  int quantity;

  CartItem({required this.dona, this.quantity = 1});

  // Método para incrementar la cantidad
  void incrementQuantity() {
    quantity++;
  }

  // Método para decrementar la cantidad
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Puedes añadir un getter para el precio total de este ítem
  double get totalPrice => dona.price * quantity;
}