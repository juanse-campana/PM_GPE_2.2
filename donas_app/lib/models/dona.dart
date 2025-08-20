// lib/models/dona.dart

class Dona {
  final int? id;
  final String name;
  final double price;
  final String image; // Ruta de la imagen en assets
  final String description;

  const Dona({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // Convierte un objeto Dona a un Map. Las llaves deben coincidir con los nombres de las columnas en la BD.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  // Crea un objeto Dona desde un Map.
  factory Dona.fromMap(Map<String, dynamic> map) {
    return Dona(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      description: map['description'],
    );
  }
}