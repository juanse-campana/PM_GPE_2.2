// lib/services/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/dona.dart'; // Asegúrate que la ruta sea correcta

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'donas_tienda.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // CAMBIO AQUÍ: Nombres de columnas en inglés
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE donas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        description TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');
    await _insertarDatosIniciales(db);
  }

  // CAMBIO AQUÍ: Usando los parámetros en inglés de la clase Dona
  Future<void> _insertarDatosIniciales(Database db) async {
    List<Dona> donasIniciales = [
      Dona(name: 'Classic Glazed', price: 1.50, description: 'The original, soft and sweet.', image: 'assets/images/dona_glaseada.png'),
      Dona(name: 'Chocolate Sprinkles', price: 1.75, description: 'Covered in chocolate and colorful sprinkles.', image: 'assets/images/dona_chispas.png'),
      Dona(name: 'Cream Filled', price: 2.00, description: 'Fluffy and filled with a smooth pastry cream.', image: 'assets/images/dona_rellena.png'),
    ];
    
    Batch batch = db.batch();
    for (var dona in donasIniciales) {
      batch.insert('donas', dona.toMap());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Dona>> getTodasLasDonas() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('donas');
    
    if (maps.isEmpty) {
        return [];
    }
    
    return List.generate(maps.length, (i) {
      return Dona.fromMap(maps[i]);
    });
  }
}