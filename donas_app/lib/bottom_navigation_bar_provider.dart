// lib/bottom_navigation_bar_provider.dart
import 'package:flutter/material.dart'; // Necesario para ChangeNotifier

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}