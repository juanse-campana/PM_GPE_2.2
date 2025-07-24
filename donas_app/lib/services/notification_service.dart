// lib/services/notification_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class NotificationService {
  // Singleton para acceder fácilmente a la instancia
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Método de inicialización
  Future<void> initialize() async {
    // Inicializar la configuración de zona horaria
    tz_data.initializeTimeZones();

    // Configuración para Android
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        ); // Usa el icono de tu app

    // Configuración para iOS
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(settings);
    print("Servicio de Notificaciones Inicializado.");
  }

  // ID único para la notificación del carrito
  static const int _cartNotificationId = 100;

  // --- FUNCIÓN CLAVE PARA PROGRAMAR LA NOTIFICACIÓN ---
  Future<void> scheduleAbandonedCartNotification() async {
    // Primero, solicita permiso en Android 13+
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    // Cancela cualquier notificación anterior para evitar duplicados
    await cancelNotification();

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'abandoned_cart_channel',
          'Recordatorios de Carrito',
          channelDescription: 'Notificaciones para carritos abandonados',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    // Programa la notificación para que se dispare en 1 hora
    await _notificationsPlugin.zonedSchedule(
      _cartNotificationId,
      '¡Tus donas te extrañan! 🍩',
      'Parece que olvidaste algo delicioso en tu carrito. ¡Completa tu pedido!',
      tz.TZDateTime.now(
        tz.local,
      ).add(const Duration(minutes: 1)), // <--- ¡AQUÍ ESTÁ LA MAGIA!
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );

    print(
      'Notificación de carrito abandonado programada para dentro de 1 minuto.',
    );
  }

  // --- FUNCIÓN CLAVE PARA CANCELAR LA NOTIFICACIÓN ---
  Future<void> cancelNotification() async {
    await _notificationsPlugin.cancel(_cartNotificationId);
    print('Notificación de carrito abandonado cancelada.');
  }
}
