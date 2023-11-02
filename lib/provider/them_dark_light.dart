
import 'package:app_shoe_store/theme/dark_mode.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightMode; 

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}